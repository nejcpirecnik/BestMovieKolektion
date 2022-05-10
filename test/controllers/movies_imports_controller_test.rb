require "test_helper"

class MoviesImportsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get movies_imports_new_url
    assert_response :success
  end

  test "should get create" do
    get movies_imports_create_url
    assert_response :success
  end
end
