class CreateTimers < ActiveRecord::Migration[7.2]
  def change
    # タイマーのテーブルを作成
    create_table :timers do |t|
      t.datetime :start_time  # タイマーの開始時間
      t.datetime :end_time    # タイマーの終了時間

      t.timestamps            # 作成日時と更新日時
    end
  end
end
