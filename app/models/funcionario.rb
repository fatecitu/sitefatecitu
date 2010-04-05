class Funcionario < ActiveRecord::Base
  belongs_to :cargo
  belongs_to :escolaridade
  
  validates_presence_of   :nome
  validates_uniqueness_of :nome
  validates_format_of     :email,    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :allow_blank => true
end
  