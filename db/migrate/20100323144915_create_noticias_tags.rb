class CreateNoticiasTags < ActiveRecord::Migration
  def self.up
    create_table :noticias_tags, :id => false  do |t|
      t.references :tag
      t.references :noticia
      t.timestamps
    end
  end

  def self.down
    drop_table :noticias_tags
  end
end
