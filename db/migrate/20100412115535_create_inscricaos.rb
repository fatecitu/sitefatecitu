class CreateInscricaos < ActiveRecord::Migration
  def self.up
    create_table :inscricaos do |t|
      t.references :evento
      t.references :account
	  t.string :observacao
      t.timestamps
    end
  end

  def self.down
    drop_table :inscricaos
  end
end
