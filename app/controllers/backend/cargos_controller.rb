class Backend::CargosController < BackendController

  def index
    params[:limit] ||= 50
    
    @column_store = column_store_for Cargo do |cm|
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
    @cargo = Cargo.new
  end

  def create
    @cargo = Cargo.new(params[:cargo])
    if @cargo.save
      redirect_parent_to(:action => "edit", :id => @cargo)
    else
      render_to_parent(:action => "new")
    end
  end

  def edit
    @cargo = Cargo.find(params[:id])
  end

  def update
    @cargo = Cargo.find(params[:id]) 
    
    if @cargo.update_attributes(params[:cargo])
      respond_to do |format|
        format.html { redirect_parent_to(:action => "edit", :id => @cargo) }
        format.json { render :json => { :success => true } }
      end
    else
      respond_to do |format|
        format.html { render_to_parent(:action => "edit") }
        format.json { render :json => { :success => false, :msg => @cargo.errors.full_messages.join("<br />") } }
      end
    end
  end
  
  # Add in your model before_destroy and if the callback returns false, 
  # all the later callbacks and the associated action are cancelled.
  def destroy
    if Cargo.find(params[:id]).destroy
      render :json => { :success => true } 
    else
      render :json => { :success => false, :msg => I18n.t("backend.general.cantDelete") }
    end
  end
end