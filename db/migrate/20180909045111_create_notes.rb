class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
