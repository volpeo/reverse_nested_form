class ProjectsController < ApplicationController
  def new
    @project = Project.new
    @company = current_user.company || Company.new
  end

  def create
    @company = current_user.company || current_user.build_company(company_params)
    @project = @company.projects.new(project_params)

    if @company.save && @project.save
      redirect_to root_path, notice: "YOUPI"
    else
      byebug
      render :new
    end
  end

  private

  def company_params
    params.require(:project).require(:company).permit(:name)
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
