class EstudiantesController < ApplicationController

  def index
    @estudiantes = Estudiante.search(params[:search]).page(params[:page]).per_page(5)

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @estudiantes }
    end
  end


  def show
    @estudiante = Estudiante.find(params[:id])

  end


  def new
    @estudiante = Estudiante.new

  end

  def edit
    @estudiante = Estudiante.find(params[:id])
  end


  def create
    @estudiante = Estudiante.new(params[:estudiante])
    render :action => :new unless @estudiante.save

  end

  def update
    @estudiante = Estudiante.find(params[:id])
    render :action => :edit unless @estudiante.update_attributes(params[:estudiantes])

  end


  def destroy
    @estudiante = Estudiante.find(params[:id])
    @estudiante.destroy

  end
end
