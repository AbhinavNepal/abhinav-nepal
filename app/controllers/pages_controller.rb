class PagesController < ApplicationController

  def world_universities
    # JSON file downloaded from:
    # https://github.com/Hipo/university-domains-list
    # Opting with this approach as issues with CORS on ajax request
    # For updated university list, this file would need to be re-downloaded.
    # FYI: last updated datestamp included in the filename
    file = File.read("#{Rails.root}/public/assets/25012018_world_universities.json")
    unis = JSON.parse(file).each_with_index.map do |uni, i|
      uni["id"] = i + 1 # view logic: required for select purposes
      uni
    end
    if name_q = params[:name]
      unis = unis.select { |u| u["name"].downcase.include?(name_q) }
    end
    render json: unis
  end

end
