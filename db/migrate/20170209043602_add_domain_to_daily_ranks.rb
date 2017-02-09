class AddDomainToDailyRanks < ActiveRecord::Migration
  def change
    add_column :daily_ranks, :domain, :string
  end
end
