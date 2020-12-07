class ScholarsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: :index

  before_action :load_and_authorize_scholar, only: [:edit, :update, :approve]

  def index
    prepare_tab
    prepare_search
    load_scholars
  end

  def new
    @scholar = Scholar.new
  end

  def create
    @scholar = Scholar.new scholar_params
    if recaptcha_valid? && @scholar.save
      redirect_to scholars_path, notice: t("flash.scholar.create.success")
    else
      flash.now[:error] = @scholar.errors[:base].to_sentence
      render :new
    end
  end

  def update
    @scholar.assign_attributes scholar_params
    if @scholar.save
      redirect_to scholars_path(tab: :in_review)
    else
      render :edit
    end
  end

  def approve
    transition_to!(:approved)
    redirect_to scholars_path(tab: :in_review)
  end

  private

  def load_and_authorize_scholar
    @scholar = Scholar.find params[:id]
    authorize @scholar
  end

  def scholar_params
    params.require(:scholar).permit policy(Scholar).permitted_attributes
  end

  def prepare_tab(tab: :approved)
    @tab = policy(Scholar).update? ? current_tab(tab) : :approved
  end

  def current_tab(tab)
    (ScholarStateMachine.states.find { |state| state == params[:tab] } || tab).to_sym
  end

  def prepare_search
    if params[:sid].present?
      @scholar = Scholar.find(params[:sid])
      params[:q] = {name_or_description_cont: @scholar.name,
                    discipline_id_or_discipline_parent_id_eq: @scholar.discipline_id}
    end
    @search = Scholar.ransack(params[:q])
    @searching = (params[:q] || {}).keys.any?(&:present?)
  end

  def load_scholars
    @scholars = if request.format.json?
                  @search.result.preload(:discipline)
                else
                  scholars_scope
                end
  end

  def scholars_scope
    @search.result
           .with_state(@tab)
           .preload(:organisation,
                    :web_urls,
                    :created_by,
                    :scholar_transitions,
                    discipline: :self_and_ancestors)
           .order(updated_at: :desc)
           .page(params[:page])
  end

  def recaptcha_valid?
    policy(@scholar).update? || verify_recaptcha(model: @scholar)
  end

  def transition_to!(state)
    ActiveRecord::Base.transaction do
      @scholar.transition_to! state
    end
  end

end
