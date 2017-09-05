class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :body, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
