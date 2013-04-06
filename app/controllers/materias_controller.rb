class MateriasController < ApplicationController

  def index
    @materias = Materia.search(params[:search]).page(params[:page]).per_page(5)

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @materias }
    end
  end


  def show
    @materia = Materia.find(params[:id])

  end


  def new
    @materia = Materia.new
    
  end

 
  def edit
    @materia = Materia.find(params[:id])
  end


  def create
    @materia = Materia.new(params[:materia])

    render :action => :new unless @materia.save

  end


  def update
    @materia = Materia.find(params[:id])
    render :action => :edit unless @materia.update_attributes(params[:matera])

  end


  def destroy
    @materia = Materia.find(params[:id])
    @materia.destroy

  end
end
