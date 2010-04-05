class CreateDisciplinas < ActiveRecord::Migration
  def self.up
    create_table :disciplinas do |t|
      t.string :nome
      t.text :ementa
      t.text :objetivo

      t.timestamps
    end
  end

  def self.down
    drop_table :disciplinas
  end
end
