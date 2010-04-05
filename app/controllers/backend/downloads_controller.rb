class Backend::DownloadsController < BackendController

  def index
    params[:limit] ||= 50
    
    @column_store = column_store_for Download do |cm|
      cm.add :download_file_name
      cm.add :download_content_type
      cm.add :download_file_size
      cm.add :created_at, :renderer => :datetime 
      cm.add :updated_at, :renderer => :datetime 
    end
    
    respond_to do |format|
      format.js 
      format.json do
        render :json => @column_store.store_data(params)
      end
    end
  end

  
  def new
    @download = Download.new
  end

  def create
    @download = Download.new(params[:download])
    if @download.save
      redirect_parent_to(:action => "edit", :id => @download)
    else
      render_to_parent(:action => "new")
    end
  end

  def edit
    @download = Download.find(params[:id])
  end

  def update
    @download = Download.find(params[:id]) 
    
    if @download.update_attributes(params[:download])
      respond_to do |format|
        format.html { redirect_parent_to(:action => "edit", :id => @download) }
        format.json { render :json => { :success => true } }
      end
    else
      respond_to do |format|
        format.html { render_to_parent(:action => "edit") }
        format.json { render :json => { :success => false, :msg => @download.errors.full_messages.join("<br />") } }
      end
    end
  end
  
  # Add in your model before_destroy and if the callback returns false, 
  # all the later callbacks and the associated action are cancelled.
  def destroy
    if Download.find(params[:id]).destroy
      render :json => { :success => true } 
    else
      render :json => { :success => false, :msg => I18n.t("backend.general.cantDelete") }
    end
  end
end