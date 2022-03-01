class Api::V1::FxTransactionsController < ApplicationController

    def index
        render json: FxTransaction.all
    end 

    def create 
        @fx_transaction = FxTransaction.new(fx_params)
        if @fx_transaction.save
            render json: @fx_transaction, status: :created
        else
            render json: { errors: @fx_transaction.errors }, status: :unprocessable_entity
        end 
    end 

    def show
        render json: FxTransaction.find(params[:id])
    end 


    private
    def fx_params
        params.require(:fx_transaction).permit(:identifier, :input_amount, :input_currency, :output_amount, :output_currency)
    end 
    
 

end
