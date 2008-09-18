class TmpfilesController < ApplicationController

  before_filter :find_tmpfile, :only => [:show, :download]
  # GET /tmpfiles
  # GET /tmpfiles.xml
  def index
    @tmpfile = Tmpfile.new
    @tmpfile_collection = get_tmpfiles_from_session
    @new_tmpfile_id = params[:new_tmpfile_id]
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tmpfile }
    end
  end

  # GET /b3sdgpqi38fnapi237c
  def show
  end

  # GET /download/qi38fnapi
  def download
    send_file @tmpfile.public_filename, :filename => @tmpfile.filename
  end
  
  # POST /tmpfiles
  # POST /tmpfiles.xml
  def create
    @tmpfile = Tmpfile.new(params[:tmpfile])
    if @tmpfile.save
      save_in_session @tmpfile
    else
      flash[:error] = _("It's no possible to save the file, Please, check the file size")
    end
    
    redirect_to :action => :index, :new_tmpfile_id => @tmpfile.id
  end

  ####### PRIVATE
  private
  
  def find_tmpfile
    @tmpfile = Tmpfile.find_by_hexkey(params[:hexkey])
    if @tmpfile.nil? || @tmpfile.cleanup_if_obsolete
      flash[:error] = "No existe el fichero seleccionado"
      redirect_to root_path
    end
  end

  def save_in_session(tmpfile)
    session[:tmpfiles] ||= Array.new
    cleanup_session
    session[:tmpfiles] << tmpfile.id
    session[:tmpfiles].uniq!
  end


  def cleanup_session
    session[:tmpfiles].each do |tmp_id|
      tmpfile = Tmpfile.find_by_id tmp_id
      session[:tmpfiles].delete(tmp_id) if tmpfile.nil?
    end
  end


  def get_tmpfiles_from_session
    tmpfiles = Array.new
    session[:tmpfiles] ||= Array.new
    session[:tmpfiles].reverse.each do |tmp_id|
      tmpfile = Tmpfile.find_by_id tmp_id
      tmpfiles << tmpfile unless (tmpfile.nil? || tmpfile.cleanup_if_obsolete)
    end
    tmpfiles
  end
end
