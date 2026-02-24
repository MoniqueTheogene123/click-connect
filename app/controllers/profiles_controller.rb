class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show ]

  # GET /profiles
  def index
    # Fetch all profiles from database
    @users = User.all  # Or @profiles = Profile.all depending on your model

    # If you need pagination (recommended for many profiles)
    @users = User.page(params[:page]).per(20)

    @breadcrumbs = [
      { content: "Profiles", href: profiles_path }
    ]
  end

  # GET /profiles/1
  def show
    @users = User.page(params[:page]).per(20)
    @breadcrumbs = [
      { content: "Profiles", href: profiles_path },
      { content: @user.full_name, href: profile_path(@user) },
    ]
  end

  private

  def set_profile
    @user = User.find(params.expect(:id))
  end
end
