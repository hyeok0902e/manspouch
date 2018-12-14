class CreateTagsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :tags_users, :id => false do |t|
      t.references :tag, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
