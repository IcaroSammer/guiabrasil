class Admin::FormPaymentsController < Admin::BaseController
  before_action :load_form_payment, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]

  def index
    @form_payments = FormPayment.all.order('name').page(params[:page] || 1).per_page(30)
  end


  def new
    @formpayment = FormPayment.new
  end

  def create
    @formpayment = FormPayment.new(formpayment_params)

    if @formpayment.save
      redirect_to admin_form_payments_path, notice: "Registro #{@formpayment.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @formpayment = FormPayment.find(params[:id])
  end


  def update
    if @formpayment.update(formpayment_params)
      redirect_to admin_form_payments_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @formpayment.active = @formpayment.active ? false : true
    if @formpayment.save
       redirect_to admin_form_payments_path, notice: @formpayment.active ? 'Registro ativado com sucesso' : 'Registro desativado com sucesso'
    end
  end
  def filters
    @form_payments  = FormPayment.order(created_at: :desc)
    @form_payments  = process_filters(params, @form_payments ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @form_payments  = @form_payments.page(params[:page] || 1).per_page(30)
        render :index
      end
    end
  end
  
  private

  def load_filter_fields
    @filters_arr = [
      {attr: :name, type: :common},
    ]
  end


  
  def load_form_payment
    @formpayment = FormPayment.find(params[:id])
  end

  def formpayment_params
    params
      .require(:form_payment)
      .permit(
        :name,
        :active,
        :order,
        business_establishment:[],
      )
  end
end
