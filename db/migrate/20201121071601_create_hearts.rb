class CreateHearts < ActiveRecord::Migration[6.0]
  def change
    create_table :hearts do |t|
      t.integer :user_id,     null: false, foreign_key: true
      t.string  :title,       null: false
      t.text    :detail,      null: false
      t.integer :category_id, null: false
      t.timestamps
    end
  end
end