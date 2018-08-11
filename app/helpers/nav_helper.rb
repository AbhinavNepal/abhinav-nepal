module NavHelper

  # Checks if link_name should be active for current controller or
  # a specific path.
  def nav_active(link_name)
    link_name = link_name.to_s
    if link_name == controller_name
      "active"
    else
      nav_path_active(link_name)
    end
  end

  private

  def nav_path_active(link_name)
    case controller_name
    when "pages" then "active" if link_name == about_path && current_page?(about_path)
    end
  end

end
