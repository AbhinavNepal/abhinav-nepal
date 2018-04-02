class ScholarsController < ApplicationController

   skip_before_action :verify_authenticity_token, only: :index

  def index
    @q = Scholar.ransack(params[:q])
    @scholars = @q.result
                  .preload(:web_urls,
                           discipline: :self_and_ancestors)
                  .order(updated_at: :desc)
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
                                    organisation_attributes: [:id,
                                                              :name,
                                                              :position,
                                                              :country_code],
                                    web_urls_attributes: [:id,
                                                          :title,
                                                          :url,
                                                          :code,
                                                          :_destroy])
  end

end
