module DisciplinesHelper

  def search_discipline_options
    Discipline.roots.preload(:self_and_descendants).flat_map(&:self_and_descendants).map do |d|
      hclass = "font-weight-bold" if d.root?
      [d.title, d.id, class: hclass]
    end
  end

end
