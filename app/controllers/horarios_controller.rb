class HorariosController < ApplicationController

  before_filter :require_login
  load_and_authorize_resource :only => [:new, :edit, :destroy]

  helper_method :sort_column, :sort_direction
  def index
  @rxp = (params[:numreg])? params[:numreg].to_i : 5

     if ((@rxp) == 0) or ((@rxp) < 0) then
        @rxp = 1
     end
     @horarios = Horario.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => (@rxp), :page => params[:page])
    #@horarios = Horario.search(params[:search]).page(params[:page]).per_page(@rxp)
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @horarios }
    end
    #Prawn::Document.generate("explicit.pdf") do |pdf|
    #pdf.text "Hello World"
#end
  end


  def show
  @horario = Horario.find(params[:id])

    respond_to do |format|
    #  format.html # show.html.erb
     # format.json { render json: @horario }    
      format.pdf do
        pdf = HorarioPdf.new(@horario, view_context)
        send_data pdf.render, filename:
        "Horario_#{@horario.id}.pdf", type: "application/pdf"
      end
    end
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

        private
  def sort_column
    Horario.column_names.include?(params[:sort]) ? params[:sort] : "aula"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
