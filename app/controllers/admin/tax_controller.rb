class Admin::TaxController < ApplicationController

  def new
    @tax = Tax.new
  end

  def create
  	tax = Tax.new(tax_params)
    tax.rate = tax.rate / 100
  	tax.save
  	redirect_to admin_info_index_path
  end

  def update
  end


  private

  def tax_params
  	params.require(:tax).permit(:rate)
  end

end