class CreateFares < ActiveRecord::Migration[5.2]
  def change
    create_table :fares do |t|
      t.string :ent
      t.string :ext
      t.integer :price

      t.timestamps
    end
  end
end
