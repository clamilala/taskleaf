class TasksController < ApplicationController
  #一覧表示
  def index
    @tasks = Task.all
  end

  #詳細表示
  def show
    @task = Task.find(params[:id])
  end

  #タスク新規登録画面へ遷移
  def new
    @task = Task.new
  end

  #タスクを登録
  def create
    task = Task.new(task_params)
    #
    task.save!
    #
    redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました。"
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to tasks_url, notice: "タスク「#{task.name}」を更新しました。"
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
  end

  #プライベートメソッド
  private

  def task_params
    #Strong Parameters
    params.require(:task).permit(:name, :description)
  end
end
