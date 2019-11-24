class Admin::GenreController < ApplicationController

   layout 'admin'

  def new
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
  	genre = Genre.new(genre_params)
  	genre.save
  	redirect_to admin_info_index_path
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admin_info_index_path
  end

  def destroy
  	genre = Genre.find(params[:id])
    genre.destroy
    redirect_to admin_info_index_path
  end

  private

  def genre_params
  	params.require(:genre).permit(:name)
  end

end

