class User::CitiesController < User::BaseController

  before_action :load_city, only: [:show, :destroy, :edit, :update]
  before_action :load_hotels, only: [:index, :filters]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @cities = City.order(:created_at).page(params[:page] || 1).per_page(30)
    
  end


  def new
    @city = City.new
    @city.build_establishment

  end

  def create
    @city = City.new(city_params)

    createCityManager = EstablishmentsManager.new()
    city_existes = createCityManager.process(@city.country, @city.state, @city.city, "validate")

    if @city.save && !city_existes
      redirect_to user_cities_path, notice: "Registro Criado com sucesso"
    else
      if city_existes
        redirect_to user_cities_path, notice: 'A cidade já está cadatrado.'
      else
        render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
      end 
    end
  end

  def edit

  end

  def show
    city = City.find(params[:id])
  end


  def update

    if @city.update_attributes(city_params)
      redirect_to user_cities_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @city.active = false
    if @city.save
     redirect_to user_cities_path, notice: 'Registro desativado com sucesso'
   end
 end
 def filters
  @cities  = City.order(created_at: :desc)
  @cities  = process_filters(params, @cities ) if params[:query].present?

  respond_to do |format|
    format.html do 
      @cities  = @cities.page(params[:page] || 1).per_page(30)
      render :index
    end
  end
end

private

def load_city
  @city = City.find(params[:id])
end

def load_filter_fields
  @filters_arr = [
    {attr: :city, type: :common},    
    {attr: :state, type: :common},
    {attr: :country, type: :common},
    {attr: :biome, type: :common},
    {attr: :region, type: :common},
  ]
end

def load_hotels
  
end

def load_restaurants

end
def load_touristattractions

end


def city_params
  params
  .require(:city)
  .permit(
    :text_apresentation,
    :best_time,
    :how_find,
    :city,
    :state,
    :country,
    :biome,
    :perfect_day,
    :special,
    :perfect_day_remarks,
    :region,
    :establishment_id,
    :best_experiences,
    differentials:[],
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




