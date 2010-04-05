class Backend::DocentesController < BackendController

  def index
    params[:limit] ||= 50
    
    @column_store = column_store_for Docente do |cm|
      cm.add :nome
      cm.add :email
      cm.add :lattes
      cm.add :twitter
      cm.add :blog
      cm.add :msn
      cm.add :ativo, :renderer => :boolean,  :align => :center, :renderer => :boolean,  :editor => { :xtype => :checkbox }  
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
    @docente = Docente.new
  end

  def create
    @docente = Docente.new(params[:docente])
    if @docente.save
      redirect_parent_to(:action => "edit", :id => @docente)
    else
      render_to_parent(:action => "new")
    end
  end

  def edit
    @docente = Docente.find(params[:id])
  end

  def update
    @docente = Docente.find(params[:id]) 
    
    if @docente.update_attributes(params[:docente])
      respond_to do |format|
        format.html { redirect_parent_to(:action => "edit", :id => @docente) }
        format.json { render :json => { :success => true } }
      end
    else
      respond_to do |format|
        format.html { render_to_parent(:action => "edit") }
        format.json { render :json => { :success => false, :msg => @docente.errors.full_messages.join("<br />") } }
      end
    end
  end
  
  # Add in your model before_destroy and if the callback returns false, 
  # all the later callbacks and the associated action are cancelled.
  def destroy
    if Docente.find(params[:id]).destroy
      render :json => { :success => true } 
    else
      render :json => { :success => false, :msg => I18n.t("backend.general.cantDelete") }
    end
  end
end