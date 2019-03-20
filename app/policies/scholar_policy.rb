class ScholarPolicy < ApplicationPolicy

  alias scholar record

  def update?
    user&.has_role?(:admin)
  end

  def approve?
    update?
  end

  def permitted_attributes
    [:first_name,
     :last_name,
     :notes,
     :description,
     :discipline_id,
     organisation_attributes: [:id, :name, :position, :country_code],
     web_urls_attributes: [:id, :title, :url, :code, :_destroy],
     created_by_attributes: [:email, :first_name, :last_name]]
  end

end
