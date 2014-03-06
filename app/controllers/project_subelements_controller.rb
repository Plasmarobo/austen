class ProjectSubelementsController < ApplicationController
  before_action :set_projectsubelement, only: [:show, :edit, :update, :destroy]
  def index
  end

  def new
  end

  def edit
  end

  def update
  end

  def show
    respond_to do |format|
      format.html
      format.ajax { render 'show', :content_type=>'text/html', :layout=>false }
    end
  end

  def destroy
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projectsubelement
      @project_subelement = ProjectSubelement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def projectsubelement_params
      params.require(:project).permit(:name, :status, :is_finished, :finished)
    end
  end
end
