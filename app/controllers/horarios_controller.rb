class HorariosController < ApplicationController

  def index
    @horarios = Horario.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @horarios }
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
