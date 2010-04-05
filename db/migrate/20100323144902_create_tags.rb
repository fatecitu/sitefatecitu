class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :descricao, :limit => 50, :null => false
      t.timestamps
    end
	#Inserindo alguns registros...
	Tag.create({:descricao => "biblioteca"})
	Tag.create({:descricao => "concurso"})
	Tag.create({:descricao => "coordenação"})
    Tag.create({:descricao => "direção"})	
	Tag.create({:descricao => "estágio"})
	Tag.create({:descricao => "eventos"})
	Tag.create({:descricao => "notícias"})
	Tag.create({:descricao => "secretaria"})
	Tag.create({:descricao => "vestibular"})
	Tag.create({:descricao => "semana de tecnologia"})
  end

  def self.down
    drop_table :tags
  end
end

