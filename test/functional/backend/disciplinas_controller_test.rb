require 'test_helper'
 
class Backend::DisciplinasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:disciplinas)
  end
 
  test "should get new" do
    get :new
    assert_response :success
  end
 
  test "should create disciplina" do
    assert_difference('Disciplina.count') do
      post :create, :disciplina => { }
    end
 
    assert_redirected_to disciplina_path(assigns(:disciplina))
  end
 
  test "should show disciplina" do
    get :show, :id => disciplinas(:one).id
    assert_response :success
  end
 
  test "should get edit" do
    get :edit, :id => disciplinas(:one).id
    assert_response :success
  end
 
  test "should update disciplina" do
    put :update, :id => disciplinas(:one).id, :disciplina => { }
    assert_redirected_to disciplina_path(assigns(:disciplina))
  end
 
  test "should destroy disciplina" do
    assert_difference('Disciplina.count', -1) do
      delete :destroy, :id => disciplinas(:one).id
    end
 
    assert_redirected_to disciplinas_path
  end
end