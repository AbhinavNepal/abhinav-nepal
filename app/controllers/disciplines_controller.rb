class DisciplinesController < ApplicationController

  def index
    @disciplines = Discipline.roots
  end

end
