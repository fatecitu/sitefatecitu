class CreateCategorianoticias < ActiveRecord::Migration
  def self.up
    create_table :categorianoticias do |t|
      t.string :descricao, :limit => 50, :null => false
      t.timestamps
    end
	#Inserindo alguns registros...
	Categorianoticia.create({:descricao => "Notícias"})
	Categorianoticia.create({:descricao => "Vestibular"})
	Categorianoticia.create({:descricao => "Secretaria Acadêmica"})
	Categorianoticia.create({:descricao => "Estágio"})
	Categorianoticia.create({:descricao => "Trabalho de Conclusão de Curso"})
	Categorianoticia.create({:descricao => "Documentos Gerais"})
	Categorianoticia.create({:descricao => "Material da Disciplina"})
	Categorianoticia.create({:descricao => "Projetos"})	
  end

  def self.down
    drop_table :categorianoticias
  end
end
