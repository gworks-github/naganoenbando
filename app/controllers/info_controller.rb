class InfoController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
    @artist = Artist.new
    @artists = Artist.all
    @label = Label.new
    @labels = Label.all
    @tax = Tax.new
    @tax_last = Tax.last
    @tax_in_postage = TaxInPostage.new
    @tax_in_postage_last = TaxInPostage.last
  end

  def update
  end

  def destroy
    # まとめる！！！
    if params[:format] == "genre"
      genre = Genre.find(params[:id])
      genre.destroy
      redirect_to admin_info_index_path
    elsif params[:format] == "artist"
      artist = Artist.find(params[:id])
      artist.destroy
      redirect_to admin_info_index_path
    elsif params[:format] == "label"
      label = Label.find(params[:id])
      label.destroy
      redirect_to admin_info_index_path
    end
  end
end
