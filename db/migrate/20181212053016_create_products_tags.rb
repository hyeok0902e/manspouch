class CreateProductsTags < ActiveRecord::Migration[5.0]
  def change
    create_table :products_tags, :id => false do |t|
      t.references :product, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
