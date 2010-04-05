class Disciplina < ActiveRecord::Base
 # Validacoes
  validates_presence_of   :nome, :ementa
  validates_uniqueness_of :nome
end
