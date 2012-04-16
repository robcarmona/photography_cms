class CreatePrivateUsers < ActiveRecord::Migration
  def self.up
    create_table :private_users do |t|
      t.string  "username"
      t.string  "first_name"
      t.string  "last_name"
      t.string  "email",:default =>'', :null => false
      t.string  "hashed_password"
      t.string  "salt",:limit => 40

      t.timestamps
    end
    add_index("private_users","username" )
  end

  def self.down
    drop_table :private_users
  end
end
