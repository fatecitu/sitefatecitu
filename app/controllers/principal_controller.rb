class PrincipalController < ApplicationController
  def index
     @noticia = Noticia.find(:all)
  end
end
