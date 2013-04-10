class MateriasController < ApplicationController

before_filter :find_materia, :except => [ :index, :create, :new ]

helper_method :sort_column, :sort_direction
  def index 
    #@materias = Materia.search(params[:search]).page(params[:page]).per_page(5)# asi estaba inicialmente
    #@rxp: variable para numero de registros a visaulizar por pagina,
    # to:i=convierte a entero, 5:valor por defecto en caso de cero,
    # @rxp:numero de registros por pagina a visualizar
    @rxp = (params[:numreg])? params[:numreg].to_i : 5
     if ((@rxp) == 0) or ((@rxp) < 0) then
        @rxp = 1
     end
     #@products = Product.order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])
    @materias = Materia.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => (@rxp), :page => params[:page])
     respond_to do |format|
        format.html # index.html.erb
        format.xml { render :xml => @materias }
      end
    
  end


  def show
    #@materia = Materia.find(params[:id])

  end


  def new
    @materia = Materia.new
    
  end

 
  def edit
    #@materia = Materia.find(params[:id])
  end


  def create
    @materia = Materia.new(params[:materia])

    render :action => :new unless @materia.save

  end


  def update
   # @materia = Materia.find(params[:id])
    render :action => :edit unless @materia.update_attributes(params[:materia])

  end


  def destroy
    #@materia = Materia.find(params[:id])
    @materia.destroy
  end
  
   def find_materia
      @materia = Materia.find(params[:id]) if params[:id]
  end

    private
  def sort_column
    Materia.column_names.include?(params[:sort]) ? params[:sort] : "nombre"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
