class Backend::EscolaridadesController < BackendController

  def index
    params[:limit] ||= 50
    
    @column_store = column_store_for Escolaridade do |cm|
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
    @escolaridade = Escolaridade.new
  end

  def create
    @escolaridade = Escolaridade.new(params[:escolaridade])
    if @escolaridade.save
      redirect_parent_to(:action => "edit", :id => @escolaridade)
    else
      render_to_parent(:action => "new")
    end
  end

  def edit
    @escolaridade = Escolaridade.find(params[:id])
  end

  def update
    @escolaridade = Escolaridade.find(params[:id]) 
    
    if @escolaridade.update_attributes(params[:escolaridade])
      respond_to do |format|
        format.html { redirect_parent_to(:action => "edit", :id => @escolaridade) }
        format.json { render :json => { :success => true } }
      end
    else
      respond_to do |format|
        format.html { render_to_parent(:action => "edit") }
        format.json { render :json => { :success => false, :msg => @escolaridade.errors.full_messages.join("<br />") } }
      end
    end
  end
  
  # Add in your model before_destroy and if the callback returns false, 
  # all the later callbacks and the associated action are cancelled.
  def destroy
    if Escolaridade.find(params[:id]).destroy
      render :json => { :success => true } 
    else
      render :json => { :success => false, :msg => I18n.t("backend.general.cantDelete") }
    end
  end
end