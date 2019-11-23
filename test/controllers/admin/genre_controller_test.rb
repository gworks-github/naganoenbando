require 'test_helper'

class Admin::GenreControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_genre_create_url
    assert_response :success
  end

end
