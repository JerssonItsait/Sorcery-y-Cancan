class InstructoresController < ApplicationController

helper_method :sort_column, :sort_direction
  def index
    @rxp = (params[:numreg])? params[:numreg].to_i : 5

       if ((@rxp) == 0) or ((@rxp) < 0) then
          @rxp = 1
       end
    @instructores = Instructor.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => (@rxp), :page => params[:page])
    #@instructores = Instructor.search(params[:search]).page(params[:page]).per_page(@rxp)
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @instructores }
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

      private
  def sort_column
    Materia.column_names.include?(params[:sort]) ? params[:sort] : "nombres"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
