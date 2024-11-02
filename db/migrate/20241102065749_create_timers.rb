class CreateTimers < ActiveRecord::Migration[7.2]
  def change
    create_table :timers do |t|
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
