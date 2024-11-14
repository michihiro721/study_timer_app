class AddTotalDurationToTimers < ActiveRecord::Migration[7.2]
  def change
    # タイマーに累計学習時間のカラムを追加
    add_column :timers, :total_duration, :integer
  end
end
