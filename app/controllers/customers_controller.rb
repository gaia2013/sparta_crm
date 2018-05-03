class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :customer_find, only: [:show, :edit, :update, :destroy]
  # before_action :set_company, only: [:new, :create, :edit, :update]

  def index
    # @customers = Customer.page(params[:page])
    @q = Customer.includes(:post, :company).ransack(params[:q])
    @customers = @q.result.page(params[:page])
  end

  def new
    @customer = Customer.new #フォーム作成のためのオブジェクト
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to @customer
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @customer.comments
      #customer_controllerを参照
  end

  def destroy
    @customer.destroy
    redirect_to customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(
      :family_name,
      :given_name,
      :email,
      :company_id,
      :post_id
    )
  end

  def customer_find
    @customer = Customer.find(params[:id])
  end

  # def set_company
  #   @companies = Company.all
  # end



end
