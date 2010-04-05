class CreateDownloads < ActiveRecord::Migration
  def self.up
    create_table :downloads do |t|
      t.string :download_file_name
      t.string :download_content_type
      t.integer :download_file_size
      t.references :categoriaarquivo

      t.timestamps
    end
  end

  def self.down
    drop_table :downloads
  end
end
