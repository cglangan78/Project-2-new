class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :url
      t.text :summary
      t.string :location

      t.timestamps null: false
    end
  end
end
