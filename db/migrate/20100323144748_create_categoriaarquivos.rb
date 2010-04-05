class CreateCategoriaarquivos < ActiveRecord::Migration
  def self.up
    create_table :categoriaarquivos do |t|
      t.string :descricao, :limit => 50, :null => false
      t.timestamps
    end
	#Inserindo alguns registros...
	Categoriaarquivo.create({:descricao => "Notícias"})
	Categoriaarquivo.create({:descricao => "Vestibular"})
	Categoriaarquivo.create({:descricao => "Secretaria Acadêmica"})
	Categoriaarquivo.create({:descricao => "Estágio"})
	Categoriaarquivo.create({:descricao => "Trabalho de Conclusão de Curso"})
	Categoriaarquivo.create({:descricao => "Documentos Gerais"})
	Categoriaarquivo.create({:descricao => "Material da Disciplina"})
	Categoriaarquivo.create({:descricao => "Projetos"})	
  end

  def self.down
    drop_table :categoriaarquivos
  end
end
