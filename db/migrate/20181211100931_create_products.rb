class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.integer :price
      t.text :body
      t.string :link
      t.string :category
      t.string :keyword
      t.float :score
      t.string :thumb

      t.boolean :normal
      t.boolean :dry
      t.boolean :oily
      t.boolean :complex
      t.boolean :sensitive

      t.boolean :notcare
      t.boolean :basecare
      t.boolean :hardcare
      t.boolean :makeup
      t.boolean :idol

      t.timestamps
    end
  end
end
