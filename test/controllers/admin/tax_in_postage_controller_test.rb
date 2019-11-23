require 'test_helper'

class Admin::TaxInPostageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_tax_in_postage_index_url
    assert_response :success
  end

end
