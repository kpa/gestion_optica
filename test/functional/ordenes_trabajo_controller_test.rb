# -*- encoding : utf-8 -*-
require File.dirname(__FILE__) + '/../test_helper'

class OrdenesTrabajoControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:ordenes_trabajo)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_orden_trabajo
    assert_difference('OrdenTrabajo.count') do
      post :create, :orden_trabajo => { }
    end

    assert_redirected_to orden_trabajo_path(assigns(:orden_trabajo))
  end

  def test_should_show_orden_trabajo
    get :show, :id => ordenes_trabajo(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => ordenes_trabajo(:one).id
    assert_response :success
  end

  def test_should_update_orden_trabajo
    put :update, :id => ordenes_trabajo(:one).id, :orden_trabajo => { }
    assert_redirected_to orden_trabajo_path(assigns(:orden_trabajo))
  end

  def test_should_destroy_orden_trabajo
    assert_difference('OrdenTrabajo.count', -1) do
      delete :destroy, :id => ordenes_trabajo(:one).id
    end

    assert_redirected_to ordenes_trabajo_path
  end
end
