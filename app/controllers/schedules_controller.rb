class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedules = Schedule.all
    @total_schedules = @schedules.count
    @today = Date.current
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)

    if @schedule.save
      flash[:notice] = 'スケジュールが作成されました。'
      redirect_to root_path
    else
      flash[:notice] = 'スケジュールの更新に失敗しました。入力内容を確認してください。'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      flash[:notice] = 'スケジュールが更新されました。'
      redirect_to root_path
    else
      flash[:notice] = 'スケジュールの更新に失敗しました。入力内容を確認してください。'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @schedule.destroy
    flash[:notice] = 'スケジュールが削除されました。'
    redirect_to root_path
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo)
  end

  # スケジュールを検索する共通処理
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end
