class BookmarksController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @bookmarks = @category.bookmarks
    authorize @bookmarks
  end

  def new
    @category = Category.find(params[:category_id])
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def show
    @category = Category.find(params[:category_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def create
   @category = Category.find(params[:category_id])
   @bookmark = current_user.bookmarks.build(params.require(:bookmark).permit(:url))
   @bookmark.category = @category
   authorize @bookmark
   if @bookmark.save 
    redirect_to @category, notice: "Bookmark was saved successfully."
  else
    flash[:error]  = "There was an error saving the bookmark.Please try again."
    render :new
  end
  end

  def edit
   @category = Category.find(params[:category_id])
   @bookmark = Bookmark.find(params[:id])
   authorize @bookmark
  end

  def update
   @category = Category.find(params[:category_id])
   @bookmark = Bookmark.find(params[:id])
   authorize @bookmark
    if @bookmark.update_attributes(params.require(:bookmark).permit(:url))
      flash[:notice] = "Bookmark was updated"
      redirect_to [@category, @bookmark]
    else
      flash[:error] = "There was an error saving the Bookmark. Please try again."
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.destroy
      respond_to do |format|
        format.js
      end
    end
  end
end
