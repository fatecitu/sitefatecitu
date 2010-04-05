class Backend::EventosController < BackendController

  def index
    params[:limit] ||= 50
    
    @column_store = column_store_for Evento do |cm|
      cm.add :nome
      cm.add :descricao
      cm.add :datainicial, :renderer => :date 
      cm.add :datafinal, :renderer => :date 
      cm.add :local
      cm.add :inscritos
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
    @evento = Evento.new
  end

  def create
    @evento = Evento.new(params[:evento])
    if @evento.save
      redirect_parent_to(:action => "edit", :id => @evento)
    else
      render_to_parent(:action => "new")
    end
  end

  def edit
    @evento = Evento.find(params[:id])
  end

  def update
    @evento = Evento.find(params[:id]) 
    
    if @evento.update_attributes(params[:evento])
      respond_to do |format|
        format.html { redirect_parent_to(:action => "edit", :id => @evento) }
        format.json { render :json => { :success => true } }
      end
    else
      respond_to do |format|
        format.html { render_to_parent(:action => "edit") }
        format.json { render :json => { :success => false, :msg => @evento.errors.full_messages.join("<br />") } }
      end
    end
  end
  
  # Add in your model before_destroy and if the callback returns false, 
  # all the later callbacks and the associated action are cancelled.
  def destroy
    if Evento.find(params[:id]).destroy
      render :json => { :success => true } 
    else
      render :json => { :success => false, :msg => I18n.t("backend.general.cantDelete") }
    end
  end
end