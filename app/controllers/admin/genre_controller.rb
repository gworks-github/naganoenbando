class Admin::GenreController < ApplicationController
 
  def new
    @genre = Genre.new
  end

  def create
  	genre = Genre.new(genre_params)
  	genre.save
  	redirect_to admin_info_index_path
  end

  def update

  end

  def destroy
  	binding.pry
  	genre = Genre.find(params[:id])
    genre.destroy
    redirect_to admin_info_index_path
  end

  private

  def genre_params
  	params.require(:genre).permit(:name)
  end

end

