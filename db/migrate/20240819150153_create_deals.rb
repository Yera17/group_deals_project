class CreateDeals < ActiveRecord::Migration[7.1]
  def change
    create_table :deals do |t|
      t.string :name
      t.float :price
      t.string :description
      t.string :category
      t.string :duration
      t.string :number_of_users
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
