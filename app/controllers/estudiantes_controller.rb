class EstudiantesController < ApplicationController

  before_filter :find_curso_estudiantes

  def index
    #@estudiantes = Estudiante.search(params[:search]).page(params[:page]).per_page(5)
    @estudiantes = @curso.estudiantes.search(params[:search]).page(params[:page]).per_page(5)
      respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @estudiantes }
    end
  end


  def show
    #@estudiante = Estudiante.find(params[:id])

  end


  def new
    
    @estudiante = Estudiante.new
    #@estudiante.curso_id = @curso.id
   # @cursos = Curso.all

  end

  def edit
   # @estudiante = Estudiante.find(params[:id])
  # @cursos = Curso.all
  end


  def create
    @estudiante = @curso.estudiantes.build(params[:estudiante])
   # @estudiante = Estudiante.new(params[:estudiante])
    #@estudiante.curso_id = @curso.id
    render :action => :new unless @estudiante.save

  end

  def update
    #@estudiante = Estudiante.find(params[:id])
   # curso_estudiantes_path(@curso)
    #@cursos = Curso.all
    render :action => :edit unless @estudiante.update_attributes(params[:estudiante])

  end


  def destroy
    #@estudiante = Estudiante.find(params[:id])
   # curso_estudiantes_path(@curso)
    @estudiante.destroy

  end

      private
  def  find_curso_estudiantes
    @curso = Curso.find( params[:curso_id]) # recupera el id del curso
    @estudiante = Estudiante.find(params[:id]) if params[:id] #recupera el id del estudiante del curso en el q se encuentra actualmente
  end

end
