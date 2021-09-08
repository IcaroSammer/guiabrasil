class User::TouristAttractionsController < User::BaseController

  before_action :load_tourist_attraction, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @tourist_attractions = TouristAttraction.all.page(params[:page] || 1).per_page(30)
  end


  def new
    @tourist_attraction = TouristAttraction.new
    @tourist_attraction.build_establishment

  end

  def create
    @tourist_attraction = TouristAttraction.new(tourist_attraction_params)

    if @tourist_attraction.save
      createCityManager = EstablishmentsManager.new()
      createCityManager.process(@tourist_attraction.establishment.nationality, @tourist_attraction.establishment.state, @tourist_attraction.establishment.city, "create")
      @tourist_attraction.establishment.business_establishment= @tourist_attraction.model_name.name
      @tourist_attraction.establishment.save
      redirect_to user_tourist_attractions_path, notice: "Registro Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit

  end

  def show
    @tourist_attraction = TouristAttraction.find(params[:id])
  end


  def update
    if @tourist_attraction.update_attributes(tourist_attraction_params)
      createCityManager = EstablishmentsManager.new()
      createCityManager.process(@tourist_attraction.establishment.nationality, @tourist_attraction.establishment.state, @tourist_attraction.establishment.city, "create")
      @tourist_attraction.establishment.business_establishment= @tourist_attraction.model_name.name
      @tourist_attraction.establishment.save      
      redirect_to user_tourist_attractions_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @tourist_attraction.active = false
    if @tourist_attraction.save
     redirect_to user_tourist_attractions_path, notice: 'Registro desativado com sucesso'
   end
 end
 def filters
  @tourist_attractions  = TouristAttraction.order(created_at: :desc)
  @tourist_attractions  = process_filters(params, @tourist_attractions ) if params[:query].present?

  respond_to do |format|
    format.html do 
      @tourist_attractions  = @tourist_attractions.page(params[:page] || 1).per_page(30)
      render :index
    end
  end
end

private

def load_filter_fields
  @filters_arr = [
    {attr: :type_attraction, type: :common},
  ]
end


def load_tourist_attraction
  @tourist_attraction = TouristAttraction.find(params[:id])
end

def tourist_attraction_params
  params
  .require(:tourist_attraction)
  .permit(
    :interest_score,
    :classification_order,
    :comment,
    :active,
    :type_attraction,
    :start_hour,
    :end_hour,
    :price_comments,
    :price,
    :category,
    week_days: [],
    start_1: [], 
    start_2: [], 
    end_1: [], 
    end_2: [],
    payments_form: [],
    photos:[],
    videos: [],
    documents: [],
    establishment_attributes: [
      :id,
      :name,
      :active,
      :environment,
      :neighborhood,
      :comfort_classification,
      :final_comment,
      :contact,
      :email,
      :address,
      :cnpj,
      :cep,
      :street,
      :complement,
      :number_address,
      :city,
      :state,
      :nationality,
      :final_note,
      :geolocalization,
      :reference_point,
      :owner,
      :telephone,
      :reservation_phone,
      :comments,
      :business_establishment,
      :facebook,
      :linkedin,
      :twitter,
      :instagram,
      :website],
      )
end
end

