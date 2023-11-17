class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.integer :product_id
      t.integer :rating
      t.string :would_repurchase
      t.string :body
      t.string :visibility
      t.boolean :published

      t.timestamps
    end
  end
end
