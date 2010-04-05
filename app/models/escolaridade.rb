class Escolaridade < ActiveRecord::Base
 # Validacoes
  validates_presence_of   :descricao
  validates_uniqueness_of :descricao
end
