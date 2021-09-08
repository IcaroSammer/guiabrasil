class Admin::EnvironmentsController < Admin::BaseController
	before_action :load_environment, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]

  def index
    @environments = Environment.all.order('name').page(params[:page] || 1).per_page(30)
  end


  def new
    @environment = Environment.new
  end

  def create
    @environment = Environment.new(environment_params)

    if @environment.save
      redirect_to admin_environments_path, notice: "Registro #{@environment.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @environment = Environment.find(params[:id])
  end


  def update
    if @environment.update(environment_params)
      redirect_to admin_environments_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
   
    @environment.active = @environment.active ? false :true
    if @environment.save
       redirect_to admin_environments_path, notice: @environment.active  ? 'Registro ativado com sucesso' : 'Registro desativado com sucesso'
    end
  end
  
  def filters
    @environments  = Environment.order(created_at: :desc)
    @environments  = process_filters(params, @environments ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @environments  = @environments.page(params[:page] || 1).per_page(30)
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


  
  def load_environment
    @environment = Environment.find(params[:id])
  end

  def environment_params
    params
      .require(:environment)
      .permit(
        :name,
        :active,
        :order,
        business_establishment:[],
      )
  end
end
