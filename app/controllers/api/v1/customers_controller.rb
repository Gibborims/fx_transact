class Api::V1::CustomersController < ApplicationController
  before_action :set_customers, only: %i[ show update ]

  def index
    customers = Services::GetCustomers.call
    render json: { errors: [], rows: customers }
  end

  def show
    customer = Customer.single_record(@customer.id)
    render json: { resp_code: SUCCESS_CODE, resp_desc: customer }
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.is_active = true
    if @customer.save
      customer = Customer.single_record(@customer.id)
      render json: {resp_code: SUCCESS_CODE, resp_desc: customer }
    else
      render json: {resp_code: FAIL_CODE, resp_desc: Utils.errors(@customer)}
    end
  end

  def update
    if @customer.update(customer_params)
      customer = Customer.single_record(@customer.id)
      render json: {resp_code: SUCCESS_CODE, resp_desc: customer }
    else
      render json: { resp_code: FAIL_CODE, resp_desc: Utils.errors(@customer) }
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
    def set_customers
      @customer = Customer.find(params[:customer_id])
    end

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :other_names, :date_of_birth, :phone_number, :location, :height, :comment, :is_active)
    end
end
