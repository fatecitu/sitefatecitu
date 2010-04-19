class Noticia < ActiveRecord::Base  
  #Relacionamentos
  belongs_to :categorianoticia
  has_and_belongs_to_many :tag
  
#Validações
  validates_presence_of   :titulo, :textocurto, :datainicio, :categorianoticia_id  
  validates_format_of     :vejamais,  :with => /\Ahttp\:\/\//, :allow_blank => true,
  :message => " é inválido! O endereço deve começar com http://"    
  
#Criando um endereço amigável

  def to_param
    "#{id}-#{titulo.downcase.gsub(/[^a-z0-9]+/i, '-')}"
  end  
  
  
    #Métodos para o N-N
  def tag_ids=(new_value)
   new_value = new_value.split(",").collect(&:to_i)
   ids = (new_value || []).reject { |nid| nid.blank? }
   self.tag = Tag.find(ids)
 end
 def tag_nomes
   self.tag.collect(&:descricao).join(", ")
 end 
  
end
