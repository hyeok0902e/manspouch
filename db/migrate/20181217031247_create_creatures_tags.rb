class CreateCreaturesTags < ActiveRecord::Migration[5.0]
  def change
    create_table :creatures_tags, :id => false do |t|
      t.references :creature, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
