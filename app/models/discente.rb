class Discente < ActiveRecord::Base
  belongs_to :curso
  belongs_to :account
   # Validacoes
  validates_presence_of   :ra
  validates_uniqueness_of :ra
end
