require 'test_helper'

class Admin::LabelControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_label_create_url
    assert_response :success
  end

end
