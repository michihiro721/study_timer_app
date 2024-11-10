class Timer < ApplicationRecord
  # 学習時間をフォーマットして返すメソッド
  def duration
    if end_time.present?
      Time.at(end_time - start_time).utc.strftime("%H:%M:%S")
    else
      "タイマーが終了していません"
    end
  end

  # 累計学習時間を計算するクラスメソッド
  def self.total_duration
    all.sum(&:duration_in_hours)
  end

  # 累計学習時間を「xx時間xx分xx秒」の形式で返すメソッド
  def self.formatted_total_duration
    total_duration = all.sum { |timer| timer.end_time && timer.start_time ? timer.end_time - timer.start_time : 0 }
    Time.at(total_duration).utc.strftime("%H:%M:%S")
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
    total_hours = all.sum { |timer| timer.end_time && timer.start_time ? (timer.end_time - timer.start_time) / 3600.0 : 0 }
    total_hours.floor
  end
end