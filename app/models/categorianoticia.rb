class Categorianoticia < ActiveRecord::Base
 # Validacoes
  validates_presence_of   :descricao
  validates_uniqueness_of :descricao
 #Relacionamentos
  has_many :noticias 
end
