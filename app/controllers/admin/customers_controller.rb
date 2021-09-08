class Admin::CustomersController <  Admin::BaseController
 before_action :load_customer, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @customers =Customer.order('created_at').page(params[:page] || 1).per_page(30)
  end


  def new
    @customer =Customer.new
  end

  def create
    @customer =Customer.new(customer_params)

    if @customer.save
      redirect_to admin_customers_path, notice: "Registro #{@customer.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @customer = Customer.find(params[:id])
  end


  def update
    if @customer.update_attributes(customer_params)
      redirect_to admin_customers_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @customer.profile.active = @customer.profile.active ? false : true  
   
    if @customer.profile.save 
       redirect_to admin_customers_path, notice: @customer.profile.active ? 'Registro ativado com sucesso' : 'Registro desativado com sucesso' 
    end
  end

  def filters
    @customers  = Customer.order(created_at: :desc)
    @customers  = process_filters(params, @customers ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @customers  = @customers.page(params[:page] || 1).per_page(30)
        render :index
      end
    end
  end
  
  private

  def load_filter_fields
    @filters_arr = [
      {attr: :email, type: :common},
    ]
  end


  
  def load_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params
      .require(:customer)
      .permit(
        :email,
        :password,
        :password_confirmation,
      )
  end
end
