class ScholarsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: :index

  def index
    set_search
    @q = Scholar.ransack(params[:q])
    load_scholars
  end

  def new
    @scholar = Scholar.new
  end

  def create
    @scholar = Scholar.new scholar_params
    if @scholar.save
      redirect_to scholars_path
    else
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
                                    web_urls_attributes: [:id, :title, :url, :code, :_destroy])
  end

  def set_search
    if params[:sid]
      @scholar = Scholar.find(params[:sid])
      params[:q] = {name_or_description_cont: @scholar.name,
                    discipline_id_or_discipline_parent_id_eq: @scholar.discipline_id}
    end
    @searching = (params[:q] || {}).values.any?(&:present?)
  end

  def load_scholars
    @scholars = @q.result
                  .preload(:organisation,
                           :web_urls,
                           discipline: :self_and_ancestors)
                  .order(updated_at: :desc)
  end

end
