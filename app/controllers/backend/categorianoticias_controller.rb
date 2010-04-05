class Backend::CategorianoticiasController < BackendController

  def index
    params[:limit] ||= 50
    
    @column_store = column_store_for Categorianoticia do |cm|
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
    @categorianoticia = Categorianoticia.new
  end

  def create
    @categorianoticia = Categorianoticia.new(params[:categorianoticia])
    if @categorianoticia.save
      redirect_parent_to(:action => "edit", :id => @categorianoticia)
    else
      render_to_parent(:action => "new")
    end
  end

  def edit
    @categorianoticia = Categorianoticia.find(params[:id])
  end

  def update
    @categorianoticia = Categorianoticia.find(params[:id]) 
    
    if @categorianoticia.update_attributes(params[:categorianoticia])
      respond_to do |format|
        format.html { redirect_parent_to(:action => "edit", :id => @categorianoticia) }
        format.json { render :json => { :success => true } }
      end
    else
      respond_to do |format|
        format.html { render_to_parent(:action => "edit") }
        format.json { render :json => { :success => false, :msg => @categorianoticia.errors.full_messages.join("<br />") } }
      end
    end
  end
  
  # Add in your model before_destroy and if the callback returns false, 
  # all the later callbacks and the associated action are cancelled.
  def destroy
    if Categorianoticia.find(params[:id]).destroy
      render :json => { :success => true } 
    else
      render :json => { :success => false, :msg => I18n.t("backend.general.cantDelete") }
    end
  end
end