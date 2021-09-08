require 'test_helper'

class BusinessEstablishmentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get business_establishment_index_url
    assert_response :success
  end

  test "should get new" do
    get business_establishment_new_url
    assert_response :success
  end

  test "should get create" do
    get business_establishment_create_url
    assert_response :success
  end

  test "should get edit" do
    get business_establishment_edit_url
    assert_response :success
  end

  test "should get update" do
    get business_establishment_update_url
    assert_response :success
  end

  test "should get show" do
    get business_establishment_show_url
    assert_response :success
  end

  test "should get destroy" do
    get business_establishment_destroy_url
    assert_response :success
  end

end
