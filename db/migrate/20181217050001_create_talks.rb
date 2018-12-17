class CreateTalks < ActiveRecord::Migration[5.0]
  def change
    create_table :talks do |t|
      t.text :body
      t.references :creature, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
