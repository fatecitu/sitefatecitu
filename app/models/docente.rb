class Docente < ActiveRecord::Base
#Relacionamentos
  belongs_to :escolaridade
  belongs_to :account
  has_and_belongs_to_many :disciplina
  
#Validações
  validates_presence_of   :nome
  validates_uniqueness_of :nome
  validates_format_of       :email,    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_format_of       :lattes, :blog,  :with => /\Ahttp\:\/\//, :allow_blank => true,
  :message => " é inválido! O endereço deve começar com http://"  
  
  #Métodos para o N-N
  def disciplina_ids=(new_value)
   new_value = new_value.split(",").collect(&:to_i)
   ids = (new_value || []).reject { |nid| nid.blank? }
   self.disciplina = Disciplina.find(ids)
 end
 def disciplina_nomes
   self.disciplina.collect(&:nome).join(", ")
 end 
  
end
