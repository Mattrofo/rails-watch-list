class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create

    @bookmark = Bookmark.new(bookmark_params)
    @movie = Movie.find(params['bookmark'][:movie_id])
    @list = List.find(params['bookmark'][:list_id])
    @bookmark.list_id = @list.id
    @bookmark.movie_id = @movie.id
    @bookmark.save

    redirect_to list_path(params[:list_id])
  end

  def show
    # @bookmark = Bookmark.find(params[:id])
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(params[:list_id]), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
