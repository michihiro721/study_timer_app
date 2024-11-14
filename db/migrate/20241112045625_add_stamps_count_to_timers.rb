class AddStampsCountToTimers < ActiveRecord::Migration[7.2]
  def change
    # タイマーにスタンプ数のカラムを追加
    add_column :timers, :stamps_count, :integer
  end
end
