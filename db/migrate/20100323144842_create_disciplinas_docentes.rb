class CreateDisciplinasDocentes < ActiveRecord::Migration
  def self.up
    create_table :disciplinas_docentes, :id => false do |t|
      t.references :disciplina
      t.references :docente
      t.timestamps
    end
  end

  def self.down
    drop_table :disciplinas_docentes
  end
end
