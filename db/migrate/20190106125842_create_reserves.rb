class CreateReserves < ActiveRecord::Migration[5.2]
  def change
    create_table :reserves do |t|
      t.string :name
      t.date :date
      t.string :ent
      t.string :ext
      t.integer :amount

      t.timestamps
    end
  end
end
