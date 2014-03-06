class ProjectElementsController < ApplicationController
  before_action :set_projectelement, only: [:show, :edit, :subelements, :update, :destroy]
  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def subelements
    @project_subelements = @project_element.project_subelements
    respond_to do |format|
      format.html
      format.ajax { render 'show', :content_type=>'text/html', :layout=>false }
    end
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projectelement
      @project_element = ProjectElement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def projectelement_params
      params.require(:project).permit(:name, :body, :status, :is_finished, :finished)
    end
  end
end
