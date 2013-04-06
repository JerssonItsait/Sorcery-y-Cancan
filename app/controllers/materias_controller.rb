class MateriasController < ApplicationController

  def index
    @materias = Materia.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @materias }
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
