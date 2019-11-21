require 'test_helper'

class Admin::ArtistControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_artist_create_url
    assert_response :success
  end

end
