class CreateCargos < ActiveRecord::Migration
  def self.up
    create_table :cargos do |t|
      t.string :descricao, :limit => 50, :null => false
      t.timestamps
    end
	#Inserindo alguns registros...
	Cargo.create({:descricao => "Bibliotecário"})
	Cargo.create({:descricao => "Vigia"})
	Cargo.create({:descricao => "Serviços de Limpeza"})
	Cargo.create({:descricao => "Secretária"})
	Cargo.create({:descricao => "Auxiliar Administrativo"})
	Cargo.create({:descricao => "Professor"})
	Cargo.create({:descricao => "Coordenador"})
	Cargo.create({:descricao => "Diretor"})
  end

  def self.down
    drop_table :cargos
  end
end
