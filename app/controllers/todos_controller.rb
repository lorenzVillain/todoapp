class TodosController < ApplicationController
  before_action :set_todo, only:[:show, :edit, :update, :destroy]
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = 'your todo was crpeated'
      redirect_to todos_path
    else
      flash[:notice] = 'Oops something went wrong'
      render 'new'
    end
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(todo_params)
      flash[:notice] = 'your todo was update'
      redirect_to todos_path
    else
      flash[:notice] = 'Oops something went wrong'
      render 'new'
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end

  def show
    @todo = Todo.find(params[:id] )
  end

  def edit
    @todo = Todo.find(params[:id])

  end
  def set_todo
    @todo =Todo.find(params[:id])
  end

  private
  def todo_params
    params.require(:todo).permit(:title)
  end

end
