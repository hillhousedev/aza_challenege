class Api::V1::CustomersController < ApplicationController

    def show 
        render json: Customer.find(params[:id])
    end 

    def create
        @customer = Customer.new(customer_params)

        if @customer.save
            render json: @customer, status: :created
        else
            render json: @customer.errors, status: :unprocessable_entity
        end 
    end 

    private 

    def customer_params
        params.require(:customer).permit(:name, :balance)
    end 
    

end
