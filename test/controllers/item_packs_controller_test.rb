require "test_helper"

class ItemPacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_pack = item_packs(:one)
  end

  test "should get index" do
    get bundles_url
    assert_response :success
  end

  test "should get new" do
    get new_bundle_url
    assert_response :success
  end

  test "should create item_pack" do
    assert_difference("Bundle.count") do
      post bundles_url, params: { item_pack: { item_id: @item_pack.item_id, quantity: @item_pack.quantity } }
    end

    assert_redirected_to bundle_url(Bundle.last)
  end

  test "should show item_pack" do
    get bundle_url(@item_pack)
    assert_response :success
  end

  test "should get edit" do
    get edit_bundle_url(@item_pack)
    assert_response :success
  end

  test "should update item_pack" do
    patch bundle_url(@item_pack), params: { item_pack: { item_id: @item_pack.item_id, quantity: @item_pack.quantity } }
    assert_redirected_to bundle_url(@item_pack)
  end

  test "should destroy item_pack" do
    assert_difference("Bundle.count", -1) do
      delete bundle_url(@item_pack)
    end

    assert_redirected_to bundles_url
  end
end
