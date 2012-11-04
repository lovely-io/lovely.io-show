class AddEmailToComments < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.string :email
    end
  end
end
