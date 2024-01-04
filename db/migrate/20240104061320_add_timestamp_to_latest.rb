class AddTimestampToLatest < ActiveRecord::Migration[7.2]
  def change
    add_column :latests, :timestamp, :datetime
  end
end
