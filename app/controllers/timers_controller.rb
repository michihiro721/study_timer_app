class TimersController < ApplicationController
  def new
    @timer = Timer.new
  end

  def create
    @timer = Timer.create(start_time: Time.current)
    if @timer.save
      redirect_to timer_path(@timer)
    else
      render :new
    end
  end

  def show
    @timer = Timer.find(params[:id])
  end

  # タイマーを開始するアクション
  def start
    @timer = Timer.create(start_time: Time.current)
    if @timer.save
      redirect_to timer_path(@timer)
    else
      render :new
    end
  end

  # タイマーを終了するアクション
  def stop
    @timer = Timer.find(params[:id])
    @timer.update(end_time: Time.current)
    redirect_to timer_path(@timer)
  end
end