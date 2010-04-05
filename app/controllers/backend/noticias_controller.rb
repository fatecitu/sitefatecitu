class Backend::NoticiasController < BackendController

  def index
    params[:limit] ||= 50
    
    @column_store = column_store_for Noticia do |cm|
      cm.add :titulo
      cm.add :textocurto
      cm.add :textolongo
      cm.add :fonte
	  cm.add "categorianoticia.descricao", :header => "Categoria da Noticia"
      cm.add :datainicio, :renderer => :date 
      cm.add :datafim, :renderer => :date 
      cm.add :vejamais
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
    @noticia = Noticia.new
  end

  def create
    @noticia = Noticia.new(params[:noticia])
    if @noticia.save
      redirect_parent_to(:action => "edit", :id => @noticia)
    else
      render_to_parent(:action => "new")
    end
  end

  def edit
    @noticia = Noticia.find(params[:id])
  end

  def update
    @noticia = Noticia.find(params[:id]) 
    
    if @noticia.update_attributes(params[:noticia])
      respond_to do |format|
        format.html { redirect_parent_to(:action => "edit", :id => @noticia) }
        format.json { render :json => { :success => true } }
      end
    else
      respond_to do |format|
        format.html { render_to_parent(:action => "edit") }
        format.json { render :json => { :success => false, :msg => @noticia.errors.full_messages.join("<br />") } }
      end
    end
  end
  
  # Add in your model before_destroy and if the callback returns false, 
  # all the later callbacks and the associated action are cancelled.
  def destroy
    if Noticia.find(params[:id]).destroy
      render :json => { :success => true } 
    else
      render :json => { :success => false, :msg => I18n.t("backend.general.cantDelete") }
    end
  end
end