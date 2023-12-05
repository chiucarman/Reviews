class ChangeIntegerToReferencesInReview < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :product_id, :integer
    add_reference :reviews, :product, foreign_key: true
  end
end
