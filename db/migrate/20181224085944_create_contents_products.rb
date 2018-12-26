class CreateContentsProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :contents_products, :id => false do |t|
      t.references :content, foreign_key: true
      t.references :product, foreign_key: true
    end
  end
end
