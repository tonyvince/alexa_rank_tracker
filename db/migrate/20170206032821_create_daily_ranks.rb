class CreateDailyRanks < ActiveRecord::Migration
  def change
    create_table :daily_ranks do |t|
      t.string :rank

      t.timestamps null: false
    end
  end
end
