class Admin::ItemsController < ApplicationController

      layout 'admin'


  layout 'admin'
# require 'to_bool'
  def new
    @item = Item.new
    disk = @item.disks.build
    track = disk.tracks.build
  end

  def create
      item = Item.create(item_params)
      redirect_to admin_items_path
    # item = Item.new(item_params)
    # item_params[:format] = item_params[:format].to_bool
    # if item_params[:format] = "true"
    #   item_params[:format] = item_params[:format].to_bool
    # elsif item_params[:format] = "false"
    #   item_params[:format] = item_params[:format].to_bool
    # end
    # item[:format] = Boolean.new.cast(item_params[:format])
    # binding.pry
    # item.save
    # redirect_to admin_items_path
  end

  def index
  	@items = Item.all
  end

  def show
	  @item = Item.find(params[:id])
    @disks = Disk.where(item_id: @item.id)
  end

  def edit
  	@item = Item.find(params[:id])
  end

  def update
  	@item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  def destroy
  	item = Item.find(params[:id])
    item.destroy
    redirect_to admin_items_path
  end

  def item_params
    params.require(:item).permit(:name,
                                 :artist_id,
                                 :label_id,
                                 :genre_id,
                                 :format,
                                 :quantity,
                                 :release_date,
                                 :is_selling,
                                 :prices,
                                 :jacket_image_id,
                                 :tax_id,
                                 disks_attributes:
                                 [:id, :disk_number, :_destroy, tracks_attributes:[:id, :track_number, :name, :_destroy]])
  end

end
