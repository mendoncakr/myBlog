class CreateUsersTable < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :full_name
  		t.string :password
  		t.string :email

  		t.timestamps
  	end
  end
end
