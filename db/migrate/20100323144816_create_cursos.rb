class CreateCursos < ActiveRecord::Migration
  def self.up
    create_table :cursos do |t|
      t.string :nome, :limit => 100, :null => false
      t.text :visaogeral
      t.string :duracao
      t.text :carreira
      t.references :funcionario
      t.timestamps
    end
  end

  def self.down
    drop_table :cursos
  end
end
