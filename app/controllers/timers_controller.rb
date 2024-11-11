class TimersController < ApplicationController
  def new
    @timer = Timer.new
    @last_timer = Timer.order(created_at: :desc).first
    @total_duration = Timer.total_duration
    @cells = params[:cells].to_i > 0 ? params[:cells].to_i : 50
  end

  def create
    @timer = Timer.create(start_time: Time.current)
    if @timer.save
      redirect_to study_timers_path
    else
      render :new
    end
  end

  def show
    @timer = Timer.find(params[:id])
  end

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
    redirect_to new_timer_path
  end

  # 累計学習時間とスタンプ数をリセットするアクション
  def reset
    Timer.delete_all
    redirect_to new_timer_path, notice: '累計学習時間とスタンプ数がリセットされました。'
  end
end