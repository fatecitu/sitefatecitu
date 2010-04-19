class Inscricao < ActiveRecord::Base
#Relacionamentos  
  belongs_to :evento
  belongs_to :account
  
  
#Validações
validates_uniqueness_of :evento_id, :scope => [:account_id], 
                        :message => 'já utilizado! - Inscrição não pode ser efetuada!'

validates :before_save, :message => 'uh'					

  def before_save
    #@limite = Evento.find(:all, :conditions => id = ?, 1)
    if Inscricao.count(:conditions => ["evento_id = ?", self.evento_id]) >= 2 #@limite.inscritos
	   
	   return false
    end
  end
end

  