class CreateEventos < ActiveRecord::Migration
  def self.up
    create_table :eventos do |t|
      t.string :nome
      t.text :descricao
      t.date :datainicial
      t.date :datafinal
      t.string :local
      t.integer :inscritos

      t.timestamps
    end
  end

  def self.down
    drop_table :eventos
  end
end
