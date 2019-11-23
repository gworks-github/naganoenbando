class Admin::LabelController < ApplicationController
 
  def new
    @label = Label.new
  end

  def create
  	label = Label.new(label_params)
  	label.save
  	redirect_to admin_info_index_path
  end

  def update

  end

  def destroy
  	label = Label.find(params[:id])
    label.destroy
    redirect_to admin_info_index_path
  end

  private

  def label_params
  	params.require(:label).permit(:name)
  end

end

