class Admin::ServicesController < Admin::BaseController
  before_action :load_service, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @services = Service.all.order('name').page(params[:page] || 1).per_page(30)
  end


  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)

    if @service.save
      redirect_to admin_services_path, notice: "Registro #{@service.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @service = Service.find(params[:id])
  end


  def update
    if @service.update(service_params)
      redirect_to admin_services_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @service.active = @service.active ? false : true 
    if @service.save
       redirect_to admin_services_path, notice: @service.active ? 'Registro ativado com sucesso' : 'Registro desativado com sucesso'
    end
  end
  def filters
    @services  = Service.order(created_at: :desc)
    @services  = process_filters(params, @services ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @services  = @services.page(params[:page] || 1).per_page(30)
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


  
  def load_service
    @service = Service.find(params[:id])
  end

  def service_params
    params
      .require(:service)
      .permit(
        :name,
        :active,
        :description,
        :order,
      )
  end
end
