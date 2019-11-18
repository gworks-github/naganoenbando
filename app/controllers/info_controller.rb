class InfoController < ApplicationController
  def index
  	@artists = Artist.all
  	@artist = Artist.new
  end
end
