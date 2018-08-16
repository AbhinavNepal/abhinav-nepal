class ScholarsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: :index

  def index
    set_search
    load_scholars
  end

  def new
    @scholar = Scholar.new
  end

  def create
    @scholar = Scholar.new scholar_params
    if recaptcha_valid? && @scholar.save
      redirect_to scholars_path
    else
      flash.now[:error] = @scholar.errors[:base].to_sentence
      render :new
    end
  end

  private

  def scholar_params
    params.require(:scholar).permit(:first_name,
                                    :last_name,
                                    :description,
                                    :discipline_id,
                                    organisation_attributes: [:id, :name, :position, :country_code],
                                    web_urls_attributes: [:id, :title, :url, :code, :_destroy],
                                    created_by_attributes: [:email])
  end

  def set_search
    if params[:sid].present?
      @scholar = Scholar.find(params[:sid])
      params[:q] = {name_or_description_cont: @scholar.name,
                    discipline_id_or_discipline_parent_id_eq: @scholar.discipline_id}
    end
    @search = Scholar.ransack(params[:q])
    @searching = (params[:q] || {}).values.any?(&:present?)
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
           .approved
           .preload(:organisation,
                    :web_urls,
                    discipline: :self_and_ancestors)
           .order(updated_at: :desc)
           .page(params[:page])
  end

  def transition_to!(state)
    ActiveRecord::Base.transaction do
      @scholar.transition_to! state
    end
  end

  def recaptcha_valid?
    current_user.present? || verify_recaptcha(model: @scholar)
  end

end
