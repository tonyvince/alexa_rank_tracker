class AddDateToDailyRanks < ActiveRecord::Migration
  def change
    add_column :daily_ranks, :date, :date
  end
end
