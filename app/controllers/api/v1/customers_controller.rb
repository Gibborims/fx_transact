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
    @customer = Customer.new(
        first_name: params['first_name'], last_name: params['last_name'],
        other_names: params['other_names'].present? ? params['other_names'] : nil,
        date_of_birth: params['date_of_birth'], phone_number: params['phone_number'],
        location: params['location'], height: params['height'], is_active: true
    )
    if @customer.save
      customer = Customer.single_record(@customer.id)
      render json: {resp_code: SUCCESS_CODE, resp_desc: customer }
    else
      render json: {resp_code: FAIL_CODE, resp_desc: Utils.errors(@customer)}
    end
  end

  def update
    @customer.assign_attributes(
        first_name: params['first_name'], last_name: params['last_name'],
        other_names: params['other_names'].present? ? params['other_names'] : nil,
        date_of_birth: params['date_of_birth'], phone_number: params['phone_number'],
        height: params['height'], location: params['location']
    )

    if @customer.save
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
end
