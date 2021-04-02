class CreateCollectionUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :collection_users do |t|
      t.references :collection, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
