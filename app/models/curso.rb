class Curso < ActiveRecord::Base
   # Relacionamentos
  belongs_to :funcionario
   # Validacoes
  validates_presence_of   :nome
  validates_uniqueness_of :nome
end
