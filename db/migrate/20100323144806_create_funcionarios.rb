class CreateFuncionarios < ActiveRecord::Migration
  def self.up
    create_table :funcionarios do |t|
      t.string :nome, :limit => 100, :null => false
      t.references :cargo
      t.references :escolaridade
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :funcionarios
  end
end
