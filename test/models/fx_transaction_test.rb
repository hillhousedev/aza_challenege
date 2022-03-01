require "test_helper"

class FxTransactionTest < ActiveSupport::TestCase
  
  test 'destroy customer should destroy linked transaction' do 
    assert_difference('FxTransaction.count', -1) do 
      customers(:one).destroy
    end 
  end


end
