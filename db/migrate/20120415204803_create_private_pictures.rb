class CreatePrivatePictures < ActiveRecord::Migration
  def self.up
    create_table :private_pictures do |t|
      t.integer "private_user_id"
      t.string  "name"
      t.string  "summary"
      t.text    "description"
      t.string  "location"
      t.string  "permalink"
      t.integer "position"
      t.boolean "visible",:default => false

      t.timestamps
    end
    add_index("private_pictures","private_user_id")
    add_index("private_pictures","permalink")
  end

  def self.down
    drop_table :private_pictures
  end
end

