require "test_helper"

class BarangaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barangay = barangays(:one)
  end

  test "should get index" do
    get barangays_url
    assert_response :success
  end

  test "should get new" do
    get new_barangay_url
    assert_response :success
  end

  test "should create barangay" do
    assert_difference("Barangay.count") do
      post barangays_url, params: { barangay: { family_count: @barangay.family_count } }
    end

    assert_redirected_to barangay_url(Barangay.last)
  end

  test "should show barangay" do
    get barangay_url(@barangay)
    assert_response :success
  end

  test "should get edit" do
    get edit_barangay_url(@barangay)
    assert_response :success
  end

  test "should update barangay" do
    patch barangay_url(@barangay), params: { barangay: { family_count: @barangay.family_count } }
    assert_redirected_to barangay_url(@barangay)
  end

  test "should destroy barangay" do
    assert_difference("Barangay.count", -1) do
      delete barangay_url(@barangay)
    end

    assert_redirected_to barangays_url
  end
end
