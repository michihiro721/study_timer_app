class TimersController < ApplicationController
  # 新しいタイマーを作成するアクション
  def new
    @timer = Timer.new
    @last_timer = Timer.order(created_at: :desc).first
    @total_duration = Timer.total_duration
    @total_stamps = (session[:total_duration] || 0) / 3600
    @total_stamps ||= 0
    @cells = params[:cells].to_i > 0 ? params[:cells].to_i : 30
    @independent_total_duration = session[:independent_total_duration] || 0
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