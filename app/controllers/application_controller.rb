class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_person

  before_action :set_current_user

  def current_person
    current_user&.person
  end

  private

  def set_current_user
    User.current = current_user
  end

end
