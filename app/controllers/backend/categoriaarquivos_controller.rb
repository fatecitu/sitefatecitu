class Backend::CategoriaarquivosController < BackendController

  def index
    params[:limit] ||= 50
    
    @column_store = column_store_for Categoriaarquivo do |cm|
      cm.add :descricao
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
    @categoriaarquivo = Categoriaarquivo.new
  end

  def create
    @categoriaarquivo = Categoriaarquivo.new(params[:categoriaarquivo])
    if @categoriaarquivo.save
      redirect_parent_to(:action => "edit", :id => @categoriaarquivo)
    else
      render_to_parent(:action => "new")
    end
  end

  def edit
    @categoriaarquivo = Categoriaarquivo.find(params[:id])
  end

  def update
    @categoriaarquivo = Categoriaarquivo.find(params[:id]) 
    
    if @categoriaarquivo.update_attributes(params[:categoriaarquivo])
      respond_to do |format|
        format.html { redirect_parent_to(:action => "edit", :id => @categoriaarquivo) }
        format.json { render :json => { :success => true } }
      end
    else
      respond_to do |format|
        format.html { render_to_parent(:action => "edit") }
        format.json { render :json => { :success => false, :msg => @categoriaarquivo.errors.full_messages.join("<br />") } }
      end
    end
  end
  
  # Add in your model before_destroy and if the callback returns false, 
  # all the later callbacks and the associated action are cancelled.
  def destroy
    if Categoriaarquivo.find(params[:id]).destroy
      render :json => { :success => true } 
    else
      render :json => { :success => false, :msg => I18n.t("backend.general.cantDelete") }
    end
  end
end