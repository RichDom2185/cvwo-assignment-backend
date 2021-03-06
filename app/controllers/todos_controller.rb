class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]
  before_action :authorized

  # GET /todos
  def index
    @todos = Todo.where(user: @user.id)

    render json: @todos
  end

  # GET /todos/1
  def show
    if @todo.user == @user
      render json: @todo
    else
      render json: { error: "Access denied" }, status: :forbidden
    end
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)
    @todo.user = @user

    if @todo.save
      render json: @todo, status: :created, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.user == @user
      if @todo.update(todo_params)
        render json: @todo
      else
        render json: @todo.errors, status: :unprocessable_entity
      end
    else
      render json: { error: "Access denied" }, status: :forbidden
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:title, :description, :tag, :completed, :date, :time)
    end
end
