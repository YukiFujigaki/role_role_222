class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    @current_user = Users::Repository.by_email(current_user&.email)
  end
end
