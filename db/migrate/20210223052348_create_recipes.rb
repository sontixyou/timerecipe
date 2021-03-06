class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.text :detail, null: false
      t.text :item, null: false
      t.text :recipe_info1, null: false
      t.text :recipe_info2, null: false
      t.text :recipe_info3, null: false
      t.text :recipe_info4
      t.text :recipe_info5
      t.integer :recipe_time_id, null: false
      t.integer :category_id, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
