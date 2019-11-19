class InfoController < ApplicationController
  def index
  	@items = Item.all
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to info_index_path
  end

  def update
    # respond_to do |format|
    #   @item.update(item_params)
    #   format.html { redirect_to request.referer, notice: 'User was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @user }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to info_index_path
  end

  def item_params
    params.require(:item).permit(:name,:artist_id,:label_id,:genre_id,:format,:quantity,:release_date,:is_selling,:prices,:jacket_image_id,:tax_id)
  end
end
