class CreatePublicPictures < ActiveRecord::Migration
  def self.up
    create_table :public_pictures do |t|
      t.string  "name"
      t.string  "summary"
      t.text    "description"
      t.string  "tag"
      t.string  "location"
      t.string  "permalink"
      t.integer "position"
      t.boolean "visible",:default =>false

      t.timestamps
    end
   add_index("public_pictures","tag")
   add_index("public_pictures","permalink")
  end

  def self.down
    drop_table :public_pictures
  end
end
