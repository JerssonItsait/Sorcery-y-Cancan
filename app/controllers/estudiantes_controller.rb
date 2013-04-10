class EstudiantesController < ApplicationController

  before_filter :find_curso_estudiantes

  helper_method :sort_column, :sort_direction
  def index
    @rxp = (params[:numreg])? params[:numreg].to_i : 5

     if ((@rxp) == 0) or ((@rxp) < 0) then
        @rxp = 1
     end
     @estudiantes = Estudiante.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => (@rxp), :page => params[:page])
    #@estudiantes = Estudiante.search(params[:search]).page(params[:page]).per_page(5) #asi viene por defecto
    #@estudiantes = @curso.estudiantes.search(params[:search]).page(params[:page]).per_page(@rxp)# así queda sin hacer ordenamiento de columnas
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

        private
  def sort_column
    Estudiante.column_names.include?(params[:sort]) ? params[:sort] : "nombre"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
