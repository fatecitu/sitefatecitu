class Backend::InscricaosController < BackendController

  def index
    params[:limit] ||= 50
    
    @column_store = column_store_for Inscricao do |cm|      
	  cm.add "evento.nome", :header => "Evento"
	  cm.add "account.email", :header => "e-mail do inscrito"
	  cm.add "account.full_name", :header => "Nome do inscrito"
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
    @inscricao = Inscricao.new
  end

  def create    
      @inscricao = Inscricao.new(params[:inscricao])
      if @inscricao.save
         redirect_parent_to(:action => "edit", :id => @inscricao)
      else
      render_to_parent(:action => "new")
	  flash[:search] = "Erro"
      end   
  end
  def edit
    @inscricao = Inscricao.find(params[:id])
  end

  def update
    @inscricao = Inscricao.find(params[:id]) 
    
    if @inscricao.update_attributes(params[:inscricao])
      respond_to do |format|
        format.html { redirect_parent_to(:action => "edit", :id => @inscricao) }
        format.json { render :json => { :success => true } }
      end
    else
      respond_to do |format|
        format.html { render_to_parent(:action => "edit") }
        format.json { render :json => { :success => false, :msg => @inscricao.errors.full_messages.join("<br />") } }
      end
    end
  end
  
  # Add in your model before_destroy and if the callback returns false, 
  # all the later callbacks and the associated action are cancelled.
  def destroy
    if Inscricao.find(params[:id]).destroy
      render :json => { :success => true } 
    else
      render :json => { :success => false, :msg => I18n.t("backend.general.cantDelete") }
    end
  end
end