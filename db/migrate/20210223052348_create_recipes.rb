class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :detail
      t.text :item
      t.text :recipe_info1
      t.text :recipe_info2
      t.text :recipe_info3
      t.text :recipe_info4
      t.text :recipe_info5
      t.integer :recipe_time_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
