class CreateFavs < ActiveRecord::Migration
  def change
    create_table :favs do |t|
      t.string :title
      t.string :url
      t.text :description
      t.string :slug

      t.timestamps
    end
  end
end
