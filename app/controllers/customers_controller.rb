class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :set_referrers, only: [:edit, :new]

  # GET order/:id/customers
  # GET /customers.json
  def index
    @customers = Customer.where(order_id: params[:order_id])
    @order = Order.find(params[:order_id])
  end

  def all
    @customers = Customer.all
    render :index
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @order = Order.find @customer.order_id
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    @customer.order_id = params[:order_id]
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    @order = @customer.order

   set_customer_defaults
    respond_to do |format|
      if @customer.save
        format.html { redirect_to @order, notice: 'Customer was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    @order = Order.find @customer.order_id
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def set_customer_defaults
    @settings = AppSettings.instance
    @customer.head_hunting_fee = @settings.default_head_hunting_fee
    @customer.id_cost = @settings.default_id_cost
    @customer.id_price = @settings.default_id_price
  end

  def set_referrers
    @referrers = (Referrer.all.collect {|r| [r.name, r.id]}).unshift(['None', ''])
  end

  def customer_params
    params.require(:customer).
      permit(:photo, :sig, :haspaid,
             :first_name, :last_name, :height,
             :weight, :eye_color, :hair_color,
             :dob, :state, :order_id, :referrer_id)
  end
end
