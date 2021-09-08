class Admin::AccommodationSizesController < Admin::BaseController

  before_action :load_accommodation_size, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]

  def index
    @accommodation_sizes =AccommodationSize.order('created_at').page(params[:page] || 1).per_page(30)
  end

  def new
    @accommodation_size =AccommodationSize.new
  end

  def create
    @accommodation_size =AccommodationSize.new(accommodation_size_params)

    if @accommodation_size.save
      redirect_to admin_accommodation_sizes_path, notice: "Registro #{@accommodation_size.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @accommodation_size = AccommodationSize.find(params[:id])
  end

  def update
    if @accommodation_size.update_attributes(accommodation_size_params)
      redirect_to admin_accommodation_sizes_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
      @accommodation_size.active = @accommodation_size.active ? false : true
    if @accommodation_size.save
        redirect_to admin_accommodation_size_path, notice: @accommodation_size.active  ? 'Registro ativado com sucesso' : 'Registro desativado com sucesso'
    end
  end

  def filters
    @accommodation_sizes  = AccommodationSize.order(created_at: :desc)
    @accommodation_sizes  = process_filters(params, @accommodation_sizes ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @accommodation_sizes  = @accommodation_sizes.page(params[:page] || 1).per_page(30)
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
  
  def load_accommodation_size
    @accommodation_size = AccommodationSize.find(params[:id])
  end

  def accommodation_size_params
    params
      .require(:accommodation_size)
      .permit(
        :name,
        :description,
        :number_of_guest,
        :active,
      )
  end

end