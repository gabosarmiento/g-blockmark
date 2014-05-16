class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    authorize @categories
  end

  def new
    @category = Category.new
    authorize @category
  end

  def show
    @category = Category.find(params[:id])
    @bookmarks = @category.bookmarks
    authorize @category
  end

  def create
    @category = Category.new(params.require(:category).permit(:name))
    authorize @category
    if @category.save
      redirect_to @category, notice: "Category was saved successfully"
    else
      flash[:error] = "Error creating topic. Please try again"
      render :new
    end 
  end

  def edit
    @category = Category.find(params[:id])
    authorize @category
  end

  def update
    @category = Category.find(params[:id])
     authorize @category
    if @category.update_attributes(params.require(:category).permit(:name))
      redirect_to @category, notice: "Category was saved successfully."
    else
      flash[:error] = "Error saving category. Please try again"
      render :edit 
    end
  end

  def destroy
    @category = Category.find(params[:id])
    name = @category.name
    authorize @category
    if @category.destroy
      flash[:success] = "Succesfully deleted #{name} category"
    else
      flash[:error] = "Error deleting category. Please try again"
    end
  end
end
