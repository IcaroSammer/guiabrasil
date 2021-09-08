class Admin::CommfortsController < Admin::BaseController

	before_action :load_commfort, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]


	def index
    @commforts = Commfort.all.order('name').page(params[:page] || 1).per_page(30)
  end


  def new
    @commfort = Commfort.new
  end

  def create
    @commfort = Commfort.new(commfort_params)

    if @commfort.save
      redirect_to admin_commforts_path, notice: "Registro #{@commfort.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @commfort = Commfort.find(params[:id])
  end


  def update
    if @commfort.update(commfort_params)
      redirect_to admin_commforts_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @commfort.active = @commfort.active ? false : true
      if @commfort.save
       redirect_to admin_commfort_path, notice: @commfort.active ? 'Registro ativado com sucesso' : 'Registro desativado com sucesso'
    end
  end
  
  def filters
    @commforts  = Commfort.order(created_at: :desc)
    @commforts  = process_filters(params, @commforts ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @commforts  = @commforts.page(params[:page] || 1).per_page(30)
        render :index
      end
    end
  end

private
  
  def load_commfort
    @commfort = Commfort.find(params[:id])
  end


  

  def load_filter_fields
    @filters_arr = [
      {attr: :name, type: :common},
    ]
  end

  def commfort_params
    params
      .require(:commfort)
      .permit(
        :name,
        :active,
        :order,
        business_establishment: []
      )
  end

end
