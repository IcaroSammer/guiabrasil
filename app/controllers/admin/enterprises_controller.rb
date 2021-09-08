class Admin::EnterprisesController < Admin::BaseController
	before_action :load_enterprise, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]

  def index
    @enterprises = Enterprise.all.order('name').page(params[:page] || 1).per_page(30)
  end


  def new
    @enterprise = Enterprise.new
  end

  def create
    @enterprise = Enterprise.new(enterprise_params)

    if @enterprise.save
      redirect_to admin_enterprises_path, notice: "Registro #{@enterprise.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @enterprise = Enterprise.find(params[:id])
  end


  def update
    if @enterprise.update(enterprise_params)
      redirect_to admin_enterprises_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
   
    @enterprise.active = @enterprise.active ? false :true
    if @enterprise.save
       redirect_to admin_enterprises_path, notice: @enterprise.active  ? 'Registro ativado com sucesso' : 'Registro desativado com sucesso'
    end
  end
  
  def filters
    @enterprises  = Enterprise.order(created_at: :desc)
    @enterprises  = process_filters(params, @enterprises ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @enterprises  = @enterprises.page(params[:page] || 1).per_page(30)
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


  
  def load_enterprise
    @enterprise = Enterprise.find(params[:id])
  end

  def enterprise_params
    params
      .require(:enterprise)
      .permit(
       :name,
    	 :nick_name,
    	 :cnpj,
    	 :foundation_date,
    	 :economic_activity_code,
    	 :economic_activity_description,
    	 :company_size,
    	 :secondary_economic_activities_code,
    	 :secondary_economic_activities_description,
    	 :legal_nature_code,
    	 :legal_nature_description,
    	 :address,
    	 :address_complement,
    	 :address_number,
    	 :neighbohood,
    	 :zip_code,
    	 :city,
    	 :state,
    	 :country_code,
    	 :country,
    	 :phone_number,
    	 :mobile_phone_number,
    	 :active,
    	 :email,
    	 :enterprise_type,
    	 :group_company,
    	 :business_partner,
    	 :user_updater,
    	 :dates_updater
      )
  end
end



