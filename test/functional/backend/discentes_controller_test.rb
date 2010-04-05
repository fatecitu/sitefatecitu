require 'test_helper'
 
class Backend::DiscentesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discentes)
  end
 
  test "should get new" do
    get :new
    assert_response :success
  end
 
  test "should create discente" do
    assert_difference('Discente.count') do
      post :create, :discente => { }
    end
 
    assert_redirected_to discente_path(assigns(:discente))
  end
 
  test "should show discente" do
    get :show, :id => discentes(:one).id
    assert_response :success
  end
 
  test "should get edit" do
    get :edit, :id => discentes(:one).id
    assert_response :success
  end
 
  test "should update discente" do
    put :update, :id => discentes(:one).id, :discente => { }
    assert_redirected_to discente_path(assigns(:discente))
  end
 
  test "should destroy discente" do
    assert_difference('Discente.count', -1) do
      delete :destroy, :id => discentes(:one).id
    end
 
    assert_redirected_to discentes_path
  end
end