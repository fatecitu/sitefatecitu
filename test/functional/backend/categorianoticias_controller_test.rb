require 'test_helper'
 
class Backend::CategorianoticiasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categorianoticias)
  end
 
  test "should get new" do
    get :new
    assert_response :success
  end
 
  test "should create categorianoticia" do
    assert_difference('Categorianoticia.count') do
      post :create, :categorianoticia => { }
    end
 
    assert_redirected_to categorianoticia_path(assigns(:categorianoticia))
  end
 
  test "should show categorianoticia" do
    get :show, :id => categorianoticias(:one).id
    assert_response :success
  end
 
  test "should get edit" do
    get :edit, :id => categorianoticias(:one).id
    assert_response :success
  end
 
  test "should update categorianoticia" do
    put :update, :id => categorianoticias(:one).id, :categorianoticia => { }
    assert_redirected_to categorianoticia_path(assigns(:categorianoticia))
  end
 
  test "should destroy categorianoticia" do
    assert_difference('Categorianoticia.count', -1) do
      delete :destroy, :id => categorianoticias(:one).id
    end
 
    assert_redirected_to categorianoticias_path
  end
end