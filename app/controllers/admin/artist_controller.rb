class Admin::ArtistController < ApplicationController

    layout 'admin'

  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def create
  	artist = Artist.new(artist_params)
  	artist.save
  	redirect_to admin_info_index_path
  end

  def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    redirect_to admin_info_index_path
  end

  def destroy
  	artist = Artist.find(params[:id])
    artist.destroy
    redirect_to admin_info_index_path
  end

  private

  def artist_params
  	params.require(:artist).permit(:name)
  end

end

