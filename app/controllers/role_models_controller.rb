class RoleModelsController < ApplicationController
  def index
    @role_models = RoleModel.all_role_models(params[:page], 10)
  end

  def new
    @role_model = RoleModel.new
  end

  def create
    @role_model_record = RoleModel.new(title: params[:title],
                                       description: params[:description],
                                       title: params[:title],
                                       description: params[:description],
                                       good_point: params[:good_point],
                                       bad_point: params[:bad_point],
                                       approach: params[:approach]
                                       )
    @role_model_record.user_id = @current_user.id
    if @role_model_record.save
      @role_model_record.save_tags(params[:tag].split(','))
    end

    redirect_to '/role_models'
  end

  def show
    @role_model = RoleModel.find(params[:id])
  end

  def edit
    @role_model = RoleModel.find(params[:id])
  end

  def update
    role_model = RoleModel.find(params[:id])

    if role_model.update(title: params[:title],
                         description: params[:description],
                         good_point: params[:good_point],
                         bad_point: params[:bad_point],
                         approach: params[:approach])

      role_model.save_tags(params[:tag].split(','))
    end

    redirect_to "/role_models/#{params[:id]}"
  end

  def search
    @role_models = RoleModel.where('title LIKE ?', "%#{params[:title]}%").order(created_at: :desc).page(params[:page]).per(10)
    render('/role_models/index')
  end
end
