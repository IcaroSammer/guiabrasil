class Admin::PaymentTypesController < Admin::BaseController
	before_action :load_payment_type, only: [:show, :destroy, :edit, :update]
	before_action :load_filter_fields, only: [:index, :filters]

	def index
    @payment_types = PaymentType.all.order('name').page(params[:page] || 1).per_page(30)
  end


  def new
    @payment_type = PaymentType.new
  end

  def create
    @payment_type = PaymentType.new(payment_type_params)
    
    if @payment_type.save
      redirect_to admin_payment_types_path, notice: "Registro #{@payment_type.name}  Criado com sucesso"
    else
      render action: :new
    end
  end

  def edit
    
  end

  def show
    @payment_type = PaymentType.find(params[:id])
  end


  def update
  	
    if @payment_type.update(payment_type_params)
      redirect_to admin_payment_types_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
   
    @payment_type.active = @payment_type.active ? false : true
    if @payment_type.save
       redirect_to admin_payment_types_path, notice: @payment_type.active ? 'Registro ativado com sucesso' : 'Registro desativado com sucesso'
    end
  end


  def filters
    @payment_types  = PaymentType.order(created_at: :desc)
    @payment_types  = process_filters(params, @payment_types ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @payment_types  = @payment_types .page(params[:page] || 1).per_page(30)
        render :index
      end
    end
  end
  
  private


  def load_filter_fields
    @filters_arr = [
      {attr: :type, type: :common},
      {attr: :brand, type: :common},
      {attr: :active, type: :common},

    ]
  end

  def load_payment_type
    @payment_type = PaymentType.find(params[:id])
  end

  def payment_type_params
    params
      .require(:payment_type)
      .permit(
      	:name,
        :brand,
        :active,
        :order,
        business_establishment: []
      )
  end	
end
