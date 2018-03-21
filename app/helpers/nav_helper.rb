module NavHelper

  def nav_active(link_name)
    "active" if link_name == controller_name
  end

end
