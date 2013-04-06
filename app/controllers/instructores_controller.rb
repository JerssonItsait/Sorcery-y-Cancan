class InstructoresController < ApplicationController

  def index
    @instructores = Instructor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @instructores }
    end
  end


  def show
    @instructor = Instructor.find(params[:id])

  end


  def new
    @instructor = Instructor.new

  end

  def edit
    @instructor = Instructor.find(params[:id])
  end


  def create
    @instructor = Instructor.new(params[:instructor])
    render :action => :new unless @instructor.save
  end


  def update
    @instructor = Instructor.find(params[:id])
    render :action => :edit unless @instructor.update_attributes(params[:instructor])
  end

  def destroy
    @instructor = Instructor.find(params[:id])
    @instructor.destroy
  end
end
