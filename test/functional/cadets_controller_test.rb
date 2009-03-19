require 'test_helper'

class CadetsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Cadet.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Cadet.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Cadet.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to cadet_url(assigns(:cadet))
  end
  
  def test_edit
    get :edit, :id => Cadet.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Cadet.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Cadet.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Cadet.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Cadet.first
    assert_redirected_to cadet_url(assigns(:cadet))
  end
  
  def test_destroy
    cadet = Cadet.first
    delete :destroy, :id => cadet
    assert_redirected_to cadets_url
    assert !Cadet.exists?(cadet.id)
  end
end
