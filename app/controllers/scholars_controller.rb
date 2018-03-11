class ScholarsController < ApplicationController

  def index
    @scholars = Scholar.preload(discipline: :self_and_ancestors)
  end

end
