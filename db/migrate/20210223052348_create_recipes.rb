class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :time
      t.text :how_to_cook
      t.timestamps
    end
  end
end
