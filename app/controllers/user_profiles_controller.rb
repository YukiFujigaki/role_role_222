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
    @notice = []
    @user_plofile = UserProfile.new(user_id: current_user.id,
                                    name: params[:profile][:name],
                                    introduction: params[:profile][:introduction],
    )

    user_profile_image if params[:profile][:image]
    user_profile_background_image if params[:profile][:background_image]

    if @notice.present?
      flash[:notice] = @notice
      return redirect_to "/user_profiles/#{@current_user.id}/new"
    end

    if @user_plofile.save
      flash[:notice] = '作成しました。'
      redirect_to("/user_profiles/#{@current_user.id}")
    else
      flash[:notice] = '作成出来ませんでした。もう一度作成して下さい。'
      redirect_to("/user_profiles/#{@current_user.id}/new")
    end
  end

  def edit
    @user_profile = user_profile
  end

  def update
    @notice = []
    @user_plofile = user_profile
    @user_plofile.name = params[:profile][:name]
    @user_plofile.introduction = params[:profile][:introduction]

    user_profile_image if params[:profile][:image]
    user_profile_background_image if params[:profile][:background_image]

    if @notice.present?
      flash[:notice] = @notice
      return redirect_to "/user_profiles/#{@current_user.id}/edit"
    end

    if @user_plofile.save
      flash[:notice] = '保存しました。'
      redirect_to("/user_profiles/#{@current_user.id}")
    else
      flash[:notice] = '保存出来ませんでした。もう一度保存して下さい。'
      redirect_to "/user_profiles/#{@current_user.id}/edit"
    end
  end

  private def user_profile
    User.find_by(id: params.permit(:id)[:id]).user_profile
  end

  private def user_profile_image
    return unless params[:profile][:image]

    if params[:profile][:image].size > 2.megabyte
      @notice << 'プロフィール画像のサイズは2MBまでです。'
    else
      @user_plofile.image = params[:profile][:image]
    end
  end

  private def user_profile_background_image
    return unless params[:profile][:background_image]

    if params[:profile][:background_image].size > 2.megabyte
      @notice << '背景画像のサイズは2MBまでです。'
    else
      @user_plofile.background_image = params[:profile][:background_image]
    end
  end
end
