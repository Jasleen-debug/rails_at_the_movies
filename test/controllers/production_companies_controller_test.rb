require "test_helper"

class ProductionCompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get production_companies_index_url
    assert_response :success
  end

  test "should get show" do
    get production_companies_show_url
    assert_response :success
  end
end
