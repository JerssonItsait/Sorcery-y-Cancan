class CursosController < ApplicationController

  def index
    @cursos = Curso.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cursos }
    end
    
  end


  def show
    @curso = Curso.find(params[:id])
   
  end


  def new
    @curso = Curso.new

  end


  def edit
    @curso = Curso.find(params[:id])
  end


  def create
    @curso = Curso.new(params[:curso])

    render :action => :new unless @curso.save
  
  end


  def update
    @curso = Curso.find(params[:id])
    
    render :action => :edit unless @curso.update_attributes(params[:curso])
  end


  def destroy
    @curso = Curso.find(params[:id])
    @curso.destroy
  end

end
