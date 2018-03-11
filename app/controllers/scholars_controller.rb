class ScholarsController < ApplicationController

  def index
    @scholars = Scholar.all
  end

end
