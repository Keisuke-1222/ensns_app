class AddImageAndProfileToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :image, :string
    add_column :users, :profile, :string
  end
end