class TimersController < ApplicationController
  def new
    @timer = Timer.new
    @last_timer = Timer.order(created_at: :desc).first
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
end