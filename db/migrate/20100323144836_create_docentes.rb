class CreateDocentes < ActiveRecord::Migration
  def self.up
    create_table :docentes do |t|
      t.string :nome
      t.references :escolaridade
      t.string :email
      t.string :lattes
      t.string :twitter
      t.string :blog
      t.string :msn
      t.boolean :ativo
      t.references :account

      t.timestamps
    end
  end

  def self.down
    drop_table :docentes
  end
end
