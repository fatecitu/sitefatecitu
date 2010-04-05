require 'test_helper'
 
class Backend::EscolaridadesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:escolaridades)
  end
 
  test "should get new" do
    get :new
    assert_response :success
  end
 
  test "should create escolaridade" do
    assert_difference('Escolaridade.count') do
      post :create, :escolaridade => { }
    end
 
    assert_redirected_to escolaridade_path(assigns(:escolaridade))
  end
 
  test "should show escolaridade" do
    get :show, :id => escolaridades(:one).id
    assert_response :success
  end
 
  test "should get edit" do
    get :edit, :id => escolaridades(:one).id
    assert_response :success
  end
 
  test "should update escolaridade" do
    put :update, :id => escolaridades(:one).id, :escolaridade => { }
    assert_redirected_to escolaridade_path(assigns(:escolaridade))
  end
 
  test "should destroy escolaridade" do
    assert_difference('Escolaridade.count', -1) do
      delete :destroy, :id => escolaridades(:one).id
    end
 
    assert_redirected_to escolaridades_path
  end
end