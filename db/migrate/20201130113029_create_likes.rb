class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :heart, foreign_key: true
      t.timestamps
      t.index [:user_id, :heart_id], unique: true
    end
  end
end
