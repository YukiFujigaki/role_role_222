class HomesController < ApplicationController
  def top
    @role_models = RoleModel.all_role_models(params[:page], 9)
  end
end
