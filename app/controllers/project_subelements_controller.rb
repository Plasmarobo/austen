class ProjectSubelementsController < ApplicationController
  before_action :set_projectsubelement, only: [:show, :edit, :update, :destroy]
  def index
  end

  def new
    @project_subelement = ProjectSubelement.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @project_subelement.update(projectsubelement_params)
        format.html { redirect_to @project_subelement, notice: 'Element was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project_subelement.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @project_element = ProjectElement.new(projectsubelement_params)

    respond_to do |format|
      if @project_subelement.save
        format.html { redirect_to @projectsub_element, notice: 'Element was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project_subelement }
      else
        format.html { render action: 'new' }
        format.json { render json: @project_subelement.errors, status: :unprocessable_entity }
      end
    end
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
