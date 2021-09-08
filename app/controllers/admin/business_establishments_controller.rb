class Admin::BusinessEstablishmentsController < Admin::BaseController
  before_action :load_business_establishment, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @business_establishments = BusinessEstablishment.all.order('name').page(params[:page] || 1).per_page(30)
  end

  def new
    @business_establishment = BusinessEstablishment.new
  end

  def create
    @business_establishment = BusinessEstablishment.new(business_establishment_params)

    if @business_establishment.save
      redirect_to admin_business_establishments_path , notice: "Tipo de establishment_termo #{@business_establishment.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
  end

  def update
    if @business_establishment.update(business_establishment_params)
      redirect_to admin_business_establishments_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def show
    @business_establishment = BusinessEstablishment.find(params[:id])
  end

  def destroy
    @business_establishment.active = @business_establishment.active ? false :true
    if @business_establishment.save
       redirect_to admin_business_establishments_path, notice: @business_establishment.active  ? 'Termo de estabelecimento ativado com sucesso' : 'Termo de estabelecimento desativado com sucesso'
    end
  end

  def filters
    @business_establishments = BusinessEstablishment.order(created_at: :desc)
    @business_establishments  = process_filters(params, @business_establishments ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @business_establishments  = @business_establishments.page(params[:page] || 1).per_page(30)
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

  def load_business_establishment
    @business_establishment = BusinessEstablishment.find(params[:id])
  end

  def business_establishment_params
    params
      .require(:business_establishment)
      .permit(
       :name,
       :description ,
       :active,
          )
  end
end
