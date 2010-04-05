class Backend::DisciplinasController < BackendController

  def index
    params[:limit] ||= 50
    
    @column_store = column_store_for Disciplina do |cm|
      cm.add :nome
      cm.add :ementa
      cm.add :objetivo
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
    @disciplina = Disciplina.new
  end

  def create
    @disciplina = Disciplina.new(params[:disciplina])
    if @disciplina.save
      redirect_parent_to(:action => "edit", :id => @disciplina)
    else
      render_to_parent(:action => "new")
    end
  end

  def edit
    @disciplina = Disciplina.find(params[:id])
  end

  def update
    @disciplina = Disciplina.find(params[:id]) 
    
    if @disciplina.update_attributes(params[:disciplina])
      respond_to do |format|
        format.html { redirect_parent_to(:action => "edit", :id => @disciplina) }
        format.json { render :json => { :success => true } }
      end
    else
      respond_to do |format|
        format.html { render_to_parent(:action => "edit") }
        format.json { render :json => { :success => false, :msg => @disciplina.errors.full_messages.join("<br />") } }
      end
    end
  end
  
  # Add in your model before_destroy and if the callback returns false, 
  # all the later callbacks and the associated action are cancelled.
  def destroy
    if Disciplina.find(params[:id]).destroy
      render :json => { :success => true } 
    else
      render :json => { :success => false, :msg => I18n.t("backend.general.cantDelete") }
    end
  end
end