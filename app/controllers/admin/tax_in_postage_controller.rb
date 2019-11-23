class Admin::TaxInPostageController < ApplicationController
  def new
    @tax_in_postage = TaxInPostage.new
  end

  def create
  	tax_in_postage = TaxInPostage.new(tax_in_postage_params)
  	tax_in_postage.save
  	redirect_to admin_info_index_path
  end

  def update
  end


  private

  def tax_in_postage_params
  	params.require(:tax_in_postage).permit(:price)
  end
end

