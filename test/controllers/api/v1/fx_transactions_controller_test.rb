require "test_helper"

class Api::V1::FxTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do 
    @fx_transaction = fx_transactions(:one)
  end 



  test 'should create fx_transaction' do 
    assert_difference('FxTransaction.count') do 
      post api_v1_fx_transactions_url, params: {
        fx_transaction: {
          identifier: @fx_transaction.identifier, 
          input_amount: @fx_transaction.input_amount,
          input_currency: @fx_transaction.input_currency,
          output_amount: @fx_transaction.output_amount,
          output_currency: @fx_transaction.output_currency,
          date_of_transaction: @fx_transaction.date_of_transaction
        }
      }, as: :json
    end
    assert_response :created
  end 

  test 'should forbid create fx_transaction' do 
    assert_no_difference('FxTransaction.count' ) do 
      post api_v1_fx_transactions_url, params: {
        fx_transaction: {
          identifier: @fx_transaction.identifier, 
          input_amount: @fx_transaction.input_amount,
          input_currency: @fx_transaction.input_currency,
          output_amount: @fx_transaction.output_amount,
          output_currency: @fx_transaction.output_currency,
          date_of_transaction: @fx_transaction.date_of_transaction

        }
      }, as: :json
    end 
    assert_response :forbidden
  end 


  

  test "should show fx transactions" do 
    get api_v1_fx_transactions_url(), as: :json
    assert_response :success
  end 


  test "should show fx_transaction" do 
    get api_v1_fx_transaction_url(@fx_transaction), as: :json
    assert_response :success

    json_response = JSON.parse(self.response.body)
    assert_equal @fx_transaction.input_currency, json_response['input_currency']
  end 

end
