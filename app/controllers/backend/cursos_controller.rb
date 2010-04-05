class Backend::CursosController < BackendController

  def index
    params[:limit] ||= 50
    
    @column_store = column_store_for Curso do |cm|
      cm.add :nome
      cm.add :visaogeral
      cm.add :duracao
      cm.add :carreira
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
    @curso = Curso.new
  end

  def create
    @curso = Curso.new(params[:curso])
    if @curso.save
      redirect_parent_to(:action => "edit", :id => @curso)
    else
      render_to_parent(:action => "new")
    end
  end

  def edit
    @curso = Curso.find(params[:id])
  end

  def update
    @curso = Curso.find(params[:id]) 
    
    if @curso.update_attributes(params[:curso])
      respond_to do |format|
        format.html { redirect_parent_to(:action => "edit", :id => @curso) }
        format.json { render :json => { :success => true } }
      end
    else
      respond_to do |format|
        format.html { render_to_parent(:action => "edit") }
        format.json { render :json => { :success => false, :msg => @curso.errors.full_messages.join("<br />") } }
      end
    end
  end
  
  # Add in your model before_destroy and if the callback returns false, 
  # all the later callbacks and the associated action are cancelled.
  def destroy
    if Curso.find(params[:id]).destroy
      render :json => { :success => true } 
    else
      render :json => { :success => false, :msg => I18n.t("backend.general.cantDelete") }
    end
  end
end