class CreateDiscentes < ActiveRecord::Migration
  def self.up
    create_table :discentes do |t|
      t.string :ra
      t.references :curso
      t.references :account

      t.timestamps
    end
  end

  def self.down
    drop_table :discentes
  end
end
