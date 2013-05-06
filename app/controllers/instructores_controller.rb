class InstructoresController < ApplicationController

before_filter :require_login

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

   respond_to do |format|
     format.html # new.html.erb
     format.json { render json: @instructor }
    end

  end

  def edit
    @instructor = Instructor.find(params[:id])
  end


  def create
    @instructor = Instructor.new(params[:instructor])
    #render :action => :new unless @instructor.save
    respond_to do |format|
      if @instructor.save
        format.html { redirect_to instructores_path, notice: 'Instructor was successfully created.' }
        format.json { render json: @instructor, status: :created, location: @instructor }
      else
        format.html { render action: "new" }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @instructor = Instructor.find(params[:id])
    #render :action => :edit unless @instructor.update_attributes(params[:instructor])
    respond_to do |format|
      if @instructor.update_attributes(params[:instructor])
        format.html { redirect_to instructores_path, notice: 'Instructor was successfully created.' }
        format.json { render  head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
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
