class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :subtitle
      t.text :body
      t.string :link
      t.string :category
      t.string :keyword

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
