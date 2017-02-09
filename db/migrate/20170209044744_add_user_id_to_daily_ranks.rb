class AddUserIdToDailyRanks < ActiveRecord::Migration
  def change
    add_column :daily_ranks, :user_id, :integer
  end
end
