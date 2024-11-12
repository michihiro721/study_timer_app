class AddStampsCountToTimers < ActiveRecord::Migration[7.2]
  def change
    add_column :timers, :stamps_count, :integer
  end
end
