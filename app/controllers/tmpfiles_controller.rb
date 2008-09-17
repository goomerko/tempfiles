class TmpfilesController < ApplicationController
  # GET /tmpfiles
  # GET /tmpfiles.xml
  def index
    @tmpfile = Tmpfile.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tmpfile }
    end
  end

  # GET /b3sdgpqi38fnapi237c
  def download
    checksum = params[:checksum]

    render :inline => 'downloading...'
  end
  
  # POST /tmpfiles
  # POST /tmpfiles.xml
  def create
    @tmpfile = Tmpfile.new(params[:tmpfile])
    if @tmpfile.save
      flash[:notice] = 'Fichero guardado correctamente'
    else
      flash[:error] = 'No se pudo guardar el fichero'
    end
    
    redirect_to :action => :index
  end

end
