class HorariosController < ApplicationController

  
  def index
    @horarios = Horario.search(params[:search]).page(params[:page]).per_page(5)
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @horarios }
    end
  end


  def show
  @horario = Horario.find(params[:id])
 
  end


  def new
    @horario = Horario.new
  end


  def edit
  @horario = Horario.find(params[:id])
  end


  def create
    @horario = Horario.new(params[:horario])
    render :action => :new unless @horario.save
  end



  def update
    @horario = Horario.find(params[:id])
    render :action => :edit unless @horario.update_attributes(params[:horario])
  end


  def destroy
   @horario = Horario.find(params[:id])
   @horario.destroy
  end

end
