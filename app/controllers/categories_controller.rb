class CategoriesController < ApplicationController
  before_action :require_login
  before_action :set_category, only: %i[show edit update destroy]

  # GET /categories
  def index
    @categories = current_user.categories
  end

  # GET /categories/1
  def show
    @todos = @category.todos
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to @category, notice: "Category was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      redirect_to @category, notice: "Category was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    redirect_to categories_path, notice: "Category was successfully deleted."
  end

  private

  def set_category
    @category = current_user.categories.find_by(id: params[:id])
    redirect_to categories_path, alert: "Not authorized." if @category.nil?
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
