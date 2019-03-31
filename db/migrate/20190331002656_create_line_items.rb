class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.references :quotation, foreign_key: true
      t.references :product, foreign_key: true
      t.float :price
      t.string :price_factors

      t.timestamps
    end
  end
end
