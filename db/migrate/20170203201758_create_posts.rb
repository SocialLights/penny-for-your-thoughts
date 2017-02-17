class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :text, null: false
      t.boolean :is_locked,  default: true

      t.timestamps
    end
  end
end
