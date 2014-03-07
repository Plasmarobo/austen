class ProjectElementsController < ApplicationController
  before_action :set_projectelement, only: [:show, :edit, :subelements, :update, :destroy]
  def index
  end

  def new
    @project_element = ProjectElement.new
  end

  def edit
  end

  def show
  end

  def update
    respond_to do |format|
      if @project_element.update(projectelement_params)
        format.html { redirect_to @project_element, notice: 'Element was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project_element.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @project_element = ProjectElement.new(projectelement_params)

    respond_to do |format|
      if @project_element.save
        format.html { redirect_to @project_element, notice: 'Element was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project_element }
        format.ajax { render :inline => "success", :layout => false }
      else
        format.html { render action: 'new' }
        format.json { render json: @project_element.errors, status: :unprocessable_entity }
        format.ajax { render action: 'new', :layout => false }
      end
    end
  end

  def elements
    respond_to do |format|
      format.ajax { render 'projects/_subelements.html.haml', locals: {subelements: @project_element.project_subelements} , formats: [:haml], layout: false}
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
      params.require(:project_element).permit(:name, :body, :status, :is_finished, :finished, :project_id)
    end
end
