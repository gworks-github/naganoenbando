class Admin::ArtistController < ApplicationController
 
  def new
    @artist = Artist.new
  end

  def create
  	artist = Artist.new(artist_params)
  	artist.save
  	redirect_to admin_info_index_path
  end

  def update

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

