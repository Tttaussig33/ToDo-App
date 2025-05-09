class TodosController < ApplicationController
  before_action :require_login
  before_action :set_todo, only: %i[show edit update destroy]

  # GET /todos
  def index
    @todos = current_user.todos
  end

  # GET /todos/completed
  def completed
    @todos = current_user.todos.where(completed: true)
  end

  # GET /todos/1
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  def create
    @todo = current_user.todos.build(todo_params)

    if @todo.save
      redirect_to @todo, notice: "Todo was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(todo_params)
      redirect_to @todo, notice: "Todo was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
    redirect_to todos_path, notice: "Todo was successfully deleted."
  end

  private

  def set_todo
    @todo = current_user.todos.find_by(id: params[:id])
    redirect_to todos_path, alert: "Not authorized." unless @todo
  end

  def todo_params
    params.require(:todo).permit(:title, :priority, :completed, :category_id)
  end
end
