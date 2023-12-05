class CreateMedia < ActiveRecord::Migration[7.0]
  def change
    create_table :media do |t|
      t.string :file
      t.references :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
