class CodeController < ApplicationController
  before_action :authenticate_admin!, except: [:show, :index, :show_tag, :tag_index]
  before_action :select_code, only: [:show, :update, :edit, :destroy, :code_tags]
  before_action :select_tag, only: [:show_tag, :edit_tag, :update_tag]
  before_action 
  def index
    @codes = Code.all
  end

  def show
  end

  def new
    @code = Code.new
    @action = "create"
  end

  def edit
    @action = "update"
  end

  def create
    code = Code.new(code_params)
    if code.save
      if params.has_key?(:links)
        params[:links].each do |tag_id|
          if !code.code_tags.exists?(tag_id)
            CodeTagLink.create({code_id: code.id, code_tag_id: tag_id})
          end
        end
      end
      flash[:notice] = "Created successfully"
      redirect_to '/code/index'
    else
      flash[:error] = code.errors
      flash[:notice] = "Save failed"
      @code = code
      render :new
    end
  end

  def update
    if @code.update(code_params)
      flash[:notice] = "Changes saved"
      render :edit
    else
      flash[:notice] = "Update failed"
      flash[:error] = code.errors
      @code = code
      render :edit
    end
  end

  def destroy
  end
  
  def tag_index
    @tags = CodeTag.all
    respond_to do |format|
      format.html {render 'tag_index', layout: false}
      format.json {render json: @tags}
    end
  end
  
  def new_tag
    @tag = CodeTag.new
    @action = "create_tag"
    render 'new_tag', layout: false
  end

  def edit_tag
    @action = "update_tag"
    render 'edit_tag', layout: false
  end

  def update_tag
    if @tag.update(tag_params)
      flash[:notice] = "Changes Saved"
      respond_to do |format|
        format.html { render 'edit_tag'}
        format.json { render json: @tag}
      end
    else
      flash[:notice] = "Save failed"
      flash[:error] = @tag.errors
      render 'edit_tag', layout: false
    end
  end

  def create_tag
    @tag = CodeTag.new(tag_params)
    if @tag.save
      respond_to do |format|
        format.html {render nothing: true, status: 200}
        format.json {render json: CodeTag.all}
      end
    else
      flash[:notice] = "Save failed"
      flash[:error] = @tag.errors
      render :edit_tag, layout: false
    end
  end

  def show_tag
  end
  
  def code_tags
    render partial: 'code_tags', layout: false, locals: {tags: @code.tags}
  end
  
  private
    def select_code
      @code = Code.find(params['code_id'])
    end
    
    def select_tag
      @tag = CodeTag.find(params['code_tag_id'])
    end
    
    def code_params
      params.require('code').permit(:id,
                                  :name,
                                  :desc,
                                  :subtitle)
    end
    
    def tag_params
      params.require('code_tag').permit(:id, :name, :style)
    end
end
