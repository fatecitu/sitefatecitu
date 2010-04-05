require 'test_helper'
 
class Backend::CategoriaarquivosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categoriaarquivos)
  end
 
  test "should get new" do
    get :new
    assert_response :success
  end
 
  test "should create categoriaarquivo" do
    assert_difference('Categoriaarquivo.count') do
      post :create, :categoriaarquivo => { }
    end
 
    assert_redirected_to categoriaarquivo_path(assigns(:categoriaarquivo))
  end
 
  test "should show categoriaarquivo" do
    get :show, :id => categoriaarquivos(:one).id
    assert_response :success
  end
 
  test "should get edit" do
    get :edit, :id => categoriaarquivos(:one).id
    assert_response :success
  end
 
  test "should update categoriaarquivo" do
    put :update, :id => categoriaarquivos(:one).id, :categoriaarquivo => { }
    assert_redirected_to categoriaarquivo_path(assigns(:categoriaarquivo))
  end
 
  test "should destroy categoriaarquivo" do
    assert_difference('Categoriaarquivo.count', -1) do
      delete :destroy, :id => categoriaarquivos(:one).id
    end
 
    assert_redirected_to categoriaarquivos_path
  end
end