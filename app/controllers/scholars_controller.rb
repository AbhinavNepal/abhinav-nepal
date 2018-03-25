class ScholarsController < ApplicationController

  def index
    @scholars = Scholar.preload(:institute,
                                :web_urls,
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
                                    :middle_name,
                                    :last_name,
                                    :description,
                                    :discipline_id,
                                    :institute_token,
                                    web_urls_attributes: [:id,
                                                          :title,
                                                          :url,
                                                          :_destroy])
  end

end
