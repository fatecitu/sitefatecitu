class Backend::FuncionariosController < BackendController

  def index
    params[:limit] ||= 50
    
    @column_store = column_store_for Funcionario do |cm|
      cm.add :nome
      cm.add :email
	  cm.add "escolaridade.descricao", :header => "Escolaridade"
      cm.add "cargo.descricao", :header => "Cargo"
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
    @funcionario = Funcionario.new
  end

  def create
    @funcionario = Funcionario.new(params[:funcionario])
    if @funcionario.save
      redirect_parent_to(:action => "edit", :id => @funcionario)
    else
      render_to_parent(:action => "new")
    end
  end

  def edit
    @funcionario = Funcionario.find(params[:id])
  end

  def update
    @funcionario = Funcionario.find(params[:id]) 
    
    if @funcionario.update_attributes(params[:funcionario])
      respond_to do |format|
        format.html { redirect_parent_to(:action => "edit", :id => @funcionario) }
        format.json { render :json => { :success => true } }
      end
    else
      respond_to do |format|
        format.html { render_to_parent(:action => "edit") }
        format.json { render :json => { :success => false, :msg => @funcionario.errors.full_messages.join("<br />") } }
      end
    end
  end
  
  # Add in your model before_destroy and if the callback returns false, 
  # all the later callbacks and the associated action are cancelled.
  def destroy
    if Funcionario.find(params[:id]).destroy
      render :json => { :success => true } 
    else
      render :json => { :success => false, :msg => I18n.t("backend.general.cantDelete") }
    end
  end
end