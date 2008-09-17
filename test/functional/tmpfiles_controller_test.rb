require 'test_helper'

class TmpfilesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:tmpfiles)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_tmpfile
    assert_difference('Tmpfile.count') do
      post :create, :tmpfile => { }
    end

    assert_redirected_to tmpfile_path(assigns(:tmpfile))
  end

  def test_should_show_tmpfile
    get :show, :id => tmpfiles(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => tmpfiles(:one).id
    assert_response :success
  end

  def test_should_update_tmpfile
    put :update, :id => tmpfiles(:one).id, :tmpfile => { }
    assert_redirected_to tmpfile_path(assigns(:tmpfile))
  end

  def test_should_destroy_tmpfile
    assert_difference('Tmpfile.count', -1) do
      delete :destroy, :id => tmpfiles(:one).id
    end

    assert_redirected_to tmpfiles_path
  end
end
