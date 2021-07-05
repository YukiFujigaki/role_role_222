class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :check_profile, unless: :create_profile?

  def set_current_user
    @current_user = Users::Repository.by_email(current_user&.email)
  end

  def check_profile
    return if guest?

    redirect_to("/user_profiles/#{@current_user.id.to_s}/new") if User.find(@current_user.id)&.user_profile.nil?
  end

  def guest?
    @current_user.id == 0
  end

  def create_profile?
    controller_name == 'user_profiles' && action_name == 'new' || action_name == 'create'
  end
end
