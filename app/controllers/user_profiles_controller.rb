class UserProfilesController < ApplicationController
  def index
    @users = User.all_role_users(params[:page], 10)
  end

  def show
    @user_profile = user_profile
  end

  def new
  end

  def create
    @user_plofile = UserProfile.new(user_id: current_user.id,
                                    name: params[:profile][:name],
                                    introduction: params[:profile][:introduction],
                                    image: user_profile_image,
                                    background_image: user_profile_background_image
    )
    if @user_plofile.save
      flash[:notice] = '作成しました。'
      redirect_to("/user_profiles/#{@current_user.id}")
    else
      flash[:notice] = '作成出来ませんでした。もう一度プロフィールを作成して下さい。'
      redirect_to("/user_profiles/#{@current_user.id}/new")
    end
  end

  def edit
    @user_profile = user_profile
  end

  def update
    @user_plofile = user_profile
    @user_plofile.name = params[:profile][:name]
    @user_plofile.introduction = params[:profile][:introduction]
    @user_plofile.image = user_profile_image if params[:profile][:image]
    @user_plofile.background_image = user_profile_background_image if params[:profile][:background_image]

    if @user_plofile.save
      flash[:notice] = '保存しました。'
      redirect_to("/user_profiles/#{@current_user.id}")
    else
      flash[:notice] = '保存出来ませんでした。もう一度プロフィールを作成して下さい。'
      redirect_to "/role_models/#{@current_user.id}/edit"
    end
  end

  private def user_profile
    User.find_by(id: params.permit(:id)[:id]).user_profile
  end

  private def user_profile_image
    return unless params[:profile][:image]

    if params[:profile][:image].size > 2.megabyte
      flash[:notice] = '画像サイズは2MBまでです。'
      render('user_profiles/new')
    else
      File.binwrite("public/user_images/#{current_user.id}.jpg", params[:profile][:image].read)
    end

    return "#{current_user.id}.jpg"
  end

  private def user_profile_background_image
    return unless params[:profile][:background_image]

    if params[:profile][:background_image].size > 2.megabyte
      flash[:notice] = '画像サイズは2MBまでです。'
      render('user_profiles/new')
    else
      File.binwrite("public/user_background_images/#{current_user.id}.jpg", params[:profile][:background_image].read)
    end

    return "#{current_user.id}.jpg"
  end
end
