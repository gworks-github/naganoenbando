class Admin::TaxController < ApplicationController
end

  def new
    @tax = Tax.new
  end

  def create
  	tax = Tax.new(tax_params)
  	tax.save
  	redirect_to info_index_path
  end

  def update
  end


  private

  def genre_params
  	params.require(:tax).permit(:rate)
  end

end