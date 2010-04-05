class CreateNoticias < ActiveRecord::Migration
  def self.up
    create_table :noticias do |t|
      t.string :titulo
      t.string :textocurto
      t.text :textolongo
      t.string :fonte
      t.date :datainicio
      t.date :datafim
      t.string :vejamais
      t.references :categorianoticia

      t.timestamps
    end
  end

  def self.down
    drop_table :noticias
  end
end
