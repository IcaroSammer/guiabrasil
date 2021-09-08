class Admin::AccommodationTypesController < Admin::BaseController
	before_action :load_accommodation_type, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @accommodation_types = AccommodationType.all.order('name').page(params[:page] || 1).per_page(30)
  end


  def new
    @accommodationtype = AccommodationType.new
  end

  def create
    @accommodationtype = AccommodationType.new(accommodationtype_params)

    if @accommodationtype.save
      redirect_to admin_accommodation_types_path, notice: "Registro #{@accommodationtype.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @accommodationtype = AccommodationType.find(params[:id])
  end


  def update
    if @accommodationtype.update(accommodationtype_params)
      redirect_to admin_accommodation_types_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
  
    @accommodationtype.active = @accommodationtype.active ? false : true
    if @accommodationtype.save
       redirect_to admin_accommodation_types_path, notice: @accommodationtype.active ? 'Registro ativado com sucesso' : 'Registro desativado com sucesso'
    end
  end
  def filters
    @accommodation_types  = AccommodationType.order(created_at: :desc)
    @accommodation_types  = process_filters(params, @accommodation_types ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @accommodation_types  = @accommodation_types.page(params[:page] || 1).per_page(30)
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


  
  def load_accommodation_type
    @accommodationtype = AccommodationType.find(params[:id])
  end

  def accommodationtype_params
    params
      .require(:accommodation_type)
      .permit(
        :name,
        :description,
        :active,
        :order,
      )
  end
end
