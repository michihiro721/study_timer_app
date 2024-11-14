class TimersController < ApplicationController
  # 新しいタイマーを作成するアクション
  def new
    @timer = Timer.new # 新しいTimerオブジェクトを作成
    @last_timer = Timer.order(created_at: :desc).first # 最新のTimerオブジェクトを取得
    @total_duration = Timer.total_duration # Timerの総合時間を取得
    @total_stamps = (session[:total_duration] || 0) / 3600 # セッションから総合時間を取得し、3600で割って時間単位に変換
    @total_stamps ||= 0 # 総合時間がnilの場合は0を設定
    @cells = params[:cells].to_i > 0 ? params[:cells].to_i : 30 # パラメータからセルの数を取得し、0以下の場合はデフォルト値30を設定
    @independent_total_duration = session[:independent_total_duration] || 0 # セッションから独立した総合時間を取得し、nilの場合は0を設定
  end

  # タイマーを作成するアクション
  def create
    @timer = Timer.create(start_time: Time.current)
    if @timer.save
      redirect_to study_timers_path
    else
      render :new
    end
  end

  # タイマーを表示するアクション
  def show
    @timer = Timer.find(params[:id])
  end

  # 学習ページを表示するアクション
  def study
    @timer = Timer.order(created_at: :desc).first
    render :show
  end

  # タイマーを開始するアクション
  def start
    @timer = Timer.create(start_time: Time.current)
    if @timer.save
      redirect_to study_timers_path
    else
      render :new
    end
  end

  # タイマーを終了するアクション
  def stop
    @timer = Timer.find(params[:id])
    @timer.update(end_time: Time.current)
    # 累計学習時間を更新
    session[:total_duration] = (session[:total_duration] || 0) + (@timer.end_time - @timer.start_time)
    session[:independent_total_duration] = (session[:independent_total_duration] || 0) + (@timer.end_time - @timer.start_time)
    redirect_to new_timer_path
  end

  # 累計学習時間をリセットするアクション
  def reset_total_duration
    Timer.delete_all
    session[:total_duration] = 0
    redirect_to new_timer_path, notice: '累計学習時間がリセットされました。'
  end

  # スタンプ数をリセットするアクション
  def reset_stamps
    session[:total_duration] = 0
    redirect_to new_timer_path, notice: 'スタンプ数がリセットされました。'
  end

  # 独立した累計学習時間をリセットするアクション
  def reset_independent_total_duration
    session[:independent_total_duration] = 0
    redirect_to new_timer_path, notice: '独立した累計学習時間がリセットされました。'
  end
end