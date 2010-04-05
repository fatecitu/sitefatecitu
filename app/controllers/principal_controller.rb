class PrincipalController < ApplicationController
  def index
     @noticias = Noticia.find(:all)
	 @eventos = Evento.find(:all)
  end  
  def procurar
      @termo = params[:busca].downcase
	  @noticias = Noticia.find(:all, :conditions => ["LOWER(titulo) LIKE ? or LOWER(textocurto) LIKE ? or LOWER(textolongo) LIKE ?", '%'+@termo+'%','%'+@termo+'%','%'+@termo+'%'])
   unless @noticias.size > 0
     flash.now[:info] = "Nao foi encontrada nenhuma noticia com esse criterio de busca!"
   end	 
  end 
end
