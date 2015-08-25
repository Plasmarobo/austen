require 'test_helper'

class CodeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get destroynew_tag" do
    get :destroynew_tag
    assert_response :success
  end

  test "should get edit_tag" do
    get :edit_tag
    assert_response :success
  end

  test "should get update_tag" do
    get :update_tag
    assert_response :success
  end

  test "should get create_tag" do
    get :create_tag
    assert_response :success
  end

  test "should get show_tag" do
    get :show_tag
    assert_response :success
  end

end
