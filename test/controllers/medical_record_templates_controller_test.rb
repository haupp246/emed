require 'test_helper'

class MedicalRecordTemplatesControllerTest < ActionController::TestCase
  setup do
    @medical_record_template = medical_record_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medical_record_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medical_record_template" do
    assert_difference('MedicalRecordTemplate.count') do
      post :create, medical_record_template: { code: @medical_record_template.code, name: @medical_record_template.name }
    end

    assert_redirected_to medical_record_template_path(assigns(:medical_record_template))
  end

  test "should show medical_record_template" do
    get :show, id: @medical_record_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medical_record_template
    assert_response :success
  end

  test "should update medical_record_template" do
    patch :update, id: @medical_record_template, medical_record_template: { code: @medical_record_template.code, name: @medical_record_template.name }
    assert_redirected_to medical_record_template_path(assigns(:medical_record_template))
  end

  test "should destroy medical_record_template" do
    assert_difference('MedicalRecordTemplate.count', -1) do
      delete :destroy, id: @medical_record_template
    end

    assert_redirected_to medical_record_templates_path
  end
end
