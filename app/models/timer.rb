class Timer < ApplicationRecord
  # 学習時間を計算するメソッド
  def duration
    if end_time && start_time
      (end_time - start_time) / 3600.0
    else
      0
    end
  end

  # 累計学習時間を計算するクラスメソッド
  def self.total_duration
    all.sum(&:duration)
  end

  # 累計時間に応じたスタンプ数を計算するクラスメソッド
  def self.stamps
    (total_duration / 1).floor
  end
end