require "test_helper"

class Api::V1::CustomersControllerTest < ActionDispatch::IntegrationTest

  setup do
    @customer = customers(:one)
  end 

  test "should show a customer" do 
    get api_v1_customer_url(@customer), as: :json
    assert_response :success
    json_response = JSON.parse(self.response.body)
    assert_equal @customer.name, json_response['name']
  end 

end
