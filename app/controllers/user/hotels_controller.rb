class User::HotelsController < User::BaseController

  before_action :load_hotel, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]
  
  

  def index
    @hotels = Hotel.all.order('updated_at').page(params[:page] || 1).per_page(30)
  end


  def new
    @hotel = Hotel.new
    @hotel.build_establishment
    @hotel.build_hotel_survey

  end

  def create
    @hotel = Hotel.new(hotel_params)
    final_score 

    if @hotel.save
      #City.create(establishment_id:  @hotel.establishment.id, city: @hotel.establishment.city, state:  @hotel.establishment.state)
      createCityManager = EstablishmentsManager.new()
      createCityManager.process(@hotel.establishment.nationality, @hotel.establishment.state, @hotel.establishment.city, "create")
      redirect_to user_hotels_path, notice: "Registro Criado com sucesso"
      @hotel.establishment.business_establishment= @hotel.model_name.name
      @hotel.establishment.save
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit

  end

  def show
    @hotel = Hotel.find(params[:id])
  end


  def update

    if @hotel.update_attributes(hotel_params)
      final_score 
      @hotel.save
      createCityManager = EstablishmentsManager.new()
      createCityManager.process(@hotel.establishment.nationality, @hotel.establishment.state, @hotel.establishment.city, "create")
      @hotel.establishment.business_establishment= @hotel.model_name.name
      @hotel.establishment.save
      redirect_to user_hotels_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit, notice: 'Houve um problema na validação de campos, confira o registro e veja se está tudo ok com ele!'
    end
  end

  def destroy
    @hotel.active = false
    if @hotel.save
      redirect_to user_hotels_path, notice: 'Registro desativado com sucesso'
    end
  end
  def filters
    @hotels  = Hotel.order(created_at: :desc)
    @hotels  = process_filters(params, @hotels ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @hotels  = @hotels.page(params[:page] || 1).per_page(30)
        render :index
      end
    end
  end
  
  private

  def load_filter_fields
    @filters_arr = [
      {attr: :final_score_evaluation, type: :common},
    ]
  end

  def final_score
    @location_score = @hotel.hotel_survey.location_score ? @hotel.hotel_survey.location_score : 0
    @circulation_score = @hotel.hotel_survey.circulation_score ? @hotel.hotel_survey.circulation_score : 0
    @conservation_score = @hotel.hotel_survey.conservation_score  ? @hotel.hotel_survey.conservation_score  : 0
    @structure_score = @hotel.hotel_survey.structure_score ? @hotel.hotel_survey.structure_score : 0
    @recreation_score = @hotel.hotel_survey.recreation_score ? @hotel.hotel_survey.recreation_score : 0
    @social_score = @hotel.hotel_survey.social_score ? @hotel.hotel_survey.social_score : 0
    @services_score = @hotel.hotel_survey.services_score ? @hotel.hotel_survey.services_score : 0
    @accomodation_score = @hotel.hotel_survey.accomodation_score ? @hotel.hotel_survey.accomodation_score : 0
    @final_rate = @hotel.hotel_survey.final_rate  ? @hotel.hotel_survey.final_rate  : 0
    
    

    @hotel.final_score_evaluation =  @location_score   + @circulation_score  + 
    @conservation_score  + @structure_score  + 
    @recreation_score  + @social_score  +
    @services_score  + @accomodation_score + @final_rate 
    

  end
  
  def load_hotel
    @hotel = Hotel.find(params[:id])
  end

  def hotel_params
    params
    .require(:hotel)
    .permit(
      :opening_date ,
      :major_renovation_date ,
      :number_of_employees ,
      :confort_rating ,
      :classification_order ,
      :price_range ,
      :environment ,
      :special_accommodation_type ,
      :has_convention_rooms ,
      :number_of_convetion_rooms ,
      :total_capacity_convention_romms ,
      :has_bars ,
      :number_of_bars ,
      :has_restaurants ,
      :number_of_restaurants ,
      :number_of_accommodations ,
      :sustainable_actions ,
      :thecnological_innivations ,
      :final_score_evaluation ,
      :active ,
      :created_at ,
      :updated_at ,
      :establishment_id ,
      :category , 
      booking_policies: [],
      accommodation_type: [],
      type_of_accomodation: [],
      rule: [], 
      accommodation_item: [], 
      enviroment: [], 
      recreation_area: [],
      structure: [],
      service: [],
      social_item: [],
      comfort: [],
      lodging: [], 
      differentials: [],
      photos:[],
      videos: [],        
      documents: [],
      payments_form: [], 
      meal_included_price: [],
      establishment_attributes: [
        :id,
        :cnpj,
        :environment,
        :comfort_classification,
        :final_comment,
        :contact,
        :email,
        :address,
        :name,
        :final_note,
        :geolocalization,
        :reference_point,
        :owner,
        :telephone,
        :reservation_phone,
        :comments,
        :created_at,
        :updated_at,
        :active,
        :business_establishment,
        :neighborhood,
        :cep,
        :street,
        :complement,
        :number_address,
        :city,
        :state,
        :nationality,
        :cnpj,
        :facebook,
        :linkedin,
        :twitter,
        :instagram,
        :website,
        :neighborhood,
      ],
      hotel_survey_attributes: [
        :id,
        :survey_date,
        :final_comments,
        :final_rate,
        :location_score,
        :circulation_score,
        :conservation_score,
        :created_at,
        :updated_at,
        :active, 
        :hotel_id,
        :structure_score,
        :recreation_score,
        :social_score,
        :services_score,
        :accomodation_score,
        :acomodation_score,
        :final_score,
        :final_comment,
        :structure_score_comments,
        :recreation_score_comments,
        :social_score_comments,
        :services_score_comments,
        :accomodation_score_comments,
        :acomodation_score_comments,
        :circulation_score_comments,
        :conservation_score_comments,
        :location_score_comments,
        recreation_items: [], 
        social_items: [], 
        structure_items: [], 
        services_items: [], 
        accommodation_items: [],
      ],
      )
  end	

end



