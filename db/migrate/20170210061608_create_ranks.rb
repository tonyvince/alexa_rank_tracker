class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.string :rank
      t.date :date
      t.integer :domain_id

      t.timestamps null: false
    end
  end
end
