require "test_helper"

class AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address = addresses(:one)
  end

  test "should get index" do
    get addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_address_url
    assert_response :success
  end

  test "should create address" do
    assert_difference('Address.count') do
      post addresses_url, params: { address: { CEP: @address.CEP, IBGE_code: @address.IBGE_code, UF: @address.UF, citizen_id: @address.citizen_id, city: @address.city, complement: @address.complement, district: @address.district, public_place: @address.public_place } }
    end

    assert_redirected_to address_url(Address.last)
  end

  test "should show address" do
    get address_url(@address)
    assert_response :success
  end

  test "should get edit" do
    get edit_address_url(@address)
    assert_response :success
  end

  test "should update address" do
    patch address_url(@address), params: { address: { CEP: @address.CEP, IBGE_code: @address.IBGE_code, UF: @address.UF, citizen_id: @address.citizen_id, city: @address.city, complement: @address.complement, district: @address.district, public_place: @address.public_place } }
    assert_redirected_to address_url(@address)
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete address_url(@address)
    end

    assert_redirected_to addresses_url
  end
end
