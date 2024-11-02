class Timer < ApplicationRecord
  # 学習時間をフォーマットして返すメソッド
  def duration
    if end_time && start_time
      total_seconds = (end_time - start_time).to_i
      hours = total_seconds / 3600
      minutes = (total_seconds % 3600) / 60
      seconds = total_seconds % 60
      "#{hours}時間#{minutes}分#{seconds}秒"
    else
      "0時間0分0秒"
    end
  end

  # 累計学習時間を計算するクラスメソッド
  def self.total_duration
    all.sum(&:duration_in_hours)
  end

  # 累計学習時間を「xx時間xx分xx秒」の形式で返すメソッド
  def self.formatted_total_duration
    total_seconds = (total_duration * 3600).to_i
    hours = total_seconds / 3600
    minutes = (total_seconds % 3600) / 60
    seconds = total_seconds % 60
    "#{hours}時間#{minutes}分#{seconds}秒"
  end

  # durationを時間単位の数値で返すヘルパーメソッド
  def duration_in_hours
    if end_time && start_time
      (end_time - start_time) / 3600.0
    else
      0
    end
  end

  # 累計時間に応じたスタンプ数を計算するクラスメソッド
  def self.stamps
    (total_duration / 1).floor
  end
end