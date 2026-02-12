class UserProjectsController < ApplicationController
  before_action :set_user_project, only: %i[ show edit update destroy ]

  # GET /user_projects
  def index
    @user_projects = UserProject.all
  end

  # GET /user_projects/1
  def show
  end

  # GET /user_projects/new
  def new
    @user_project = UserProject.new
  end

  # GET /user_projects/1/edit
  def edit
  end

  # POST /user_projects
  def create
    @user_project = UserProject.new(user_project_params)

    if @user_project.save
      redirect_to @user_project, notice: "User project was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_projects/1
  def update
    if @user_project.update(user_project_params)
      redirect_to @user_project, notice: "User project was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /user_projects/1
  def destroy
    @user_project.destroy!
    redirect_to user_projects_path, notice: "User project was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_project
      @user_project = UserProject.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def user_project_params
      params.expect(user_project: [ :user_id, :project_id ])
    end
end
