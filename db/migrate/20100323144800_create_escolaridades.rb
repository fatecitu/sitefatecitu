class CreateEscolaridades < ActiveRecord::Migration
  def self.up
    create_table :escolaridades do |t|
      t.string :descricao, :limit => 50, :null => false
      t.timestamps
    end
	#Inserindo alguns registros...
	Escolaridade.create({:descricao => "Analfabeto"})
	Escolaridade.create({:descricao => "Primeiro Grau"})
	Escolaridade.create({:descricao => "Segundo Grau"})
	Escolaridade.create({:descricao => "Nivel Superior"})
	Escolaridade.create({:descricao => "Pós Graduação"})
	Escolaridade.create({:descricao => "Mestrado"})
	Escolaridade.create({:descricao => "Doutorado"})
	Escolaridade.create({:descricao => "Pós-Doutorado"})
  end

  def self.down
    drop_table :escolaridades
  end
end
