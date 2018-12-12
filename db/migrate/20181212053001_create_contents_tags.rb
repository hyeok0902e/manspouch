class CreateContentsTags < ActiveRecord::Migration[5.0]
  def change
    create_table :contents_tags, :id => false do |t|
      t.references :content, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
