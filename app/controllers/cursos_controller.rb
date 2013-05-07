class CursosController < ApplicationController

before_filter :require_login
load_and_authorize_resource :only => [:new, :edit, :destroy]

before_filter :find_curso, :except => [ :index, :create, :new ]

helper_method :sort_column, :sort_direction
  def index
    @rxp = (params[:numreg])? params[:numreg].to_i : 5

     if ((@rxp) == 0) or ((@rxp) < 0) then
        @rxp = 1
     end
     @cursos = Curso.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => (@rxp), :page => params[:page])
    #@cursos = Curso.search(params[:search]).page(params[:page]).per_page(@rxp)

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @cursos }
    end
    
  end


  def show
   # @curso = Curso.find(params[:id])
   
  end


  def new
    @curso = Curso.new

  end


  def edit
    #@curso = Curso.find(params[:id])
  end


  def create
    @curso = Curso.new(params[:curso])
    @cursos = Curso.all
    render :action => :new unless @curso.save
  
  end


  def update
    #@curso = Curso.find(params[:id])
    
    render :action => :edit unless @curso.update_attributes(params[:curso])
  end


  def destroy
    #@curso = Curso.find(params[:id])
    @curso.destroy
    @cursos = Curso.all
  end

  def find_curso
      @curso = Curso.find(params[:id]) if params[:id]
  end

        private
  def sort_column
    Curso.column_names.include?(params[:sort]) ? params[:sort] : "nombre"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
