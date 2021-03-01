class TasksController < ApplicationController
  #一覧表示
  def index
    #降順ソート
    @tasks = current_user.tasks.order(created_at: :desc)
  end

  #詳細表示
  def show
    @task = current_user.tasks.find(params[:id])
  end

  #タスク新規登録画面へ遷移
  def new
    @task = Task.new
  end

  #タスクを登録
  def create
    @task = current_user.task.new(task_params)
    
    #.save→検証エラーの場合はfalseが返ってくる
    if @task.save
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      #検証エラーの場合、登録画面へ戻す
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    task = current_user.tasks.find(params[:id])
    task.update(task_params)
    redirect_to tasks_url, notice: "タスク「#{task.name}」を更新しました。"
  end

  def destroy
    task = current_user.tasks.find(params[:id])
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
