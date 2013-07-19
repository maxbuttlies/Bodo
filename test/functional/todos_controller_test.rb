require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  test "should get editor" do
    get :editor
    assert_response :success
  end

  test "should get add" do
    get :add
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get done" do
    get :done
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
  end

end
