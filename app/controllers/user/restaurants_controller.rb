class User::RestaurantsController < User::BaseController

  before_action :load_restaurant, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @restaurants = Restaurant.all.page(params[:page] || 1).per_page(30)
  end


  def new
    @restaurant = Restaurant.new
    @restaurant.build_establishment
    @restaurant.build_restaurant_survey
    @restaurant.build_chef
    @restaurant.main_courses.build
    
  end

  def create
   @restaurant = Restaurant.new(restaurant_params)
   
   if @restaurant.save
    final_note
    createCityManager = EstablishmentsManager.new()
    createCityManager.process(@restaurant.establishment.nationality, @restaurant.establishment.state, @restaurant.establishment.city, "create")
    @restaurant.establishment.business_establishment= @restaurant.model_name.name
    @restaurant.establishment.save
    redirect_to user_restaurants_path, notice: "Registro Criado com sucesso"
  else
    render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
  end
end

def edit
  @restaurant.main_courses.build unless @restaurant.main_courses.present?
end

def show
  @restaurant = Restaurant.find(params[:id])
end


def update
  if @restaurant.update_attributes(restaurant_params)
    final_note 
    createCityManager = EstablishmentsManager.new()
    createCityManager.process(@restaurant.establishment.nationality, @restaurant.establishment.state, @restaurant.establishment.city, "create")
    @restaurant.establishment.business_establishment= @restaurant.model_name.name
    @restaurant.establishment.save
    redirect_to user_restaurants_path, notice: 'Atualizado com sucesso'
  else
    render action: :edit
  end
end

def destroy
  @restaurant.active = false
  if @restaurant.save
   redirect_to user_restaurants_path, notice: 'Registro desativado com sucesso'
 end
end
def filters
  @restaurants  = Restaurant.order(created_at: :desc)
  @restaurants  = process_filters(params, @restaurants ) if params[:query].present?

  respond_to do |format|
    format.html do 
      @restaurants  = @restaurants.page(params[:page] || 1).per_page(30)
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

def final_note
 @establishment = @restaurant.establishment
 @couvert  = @restaurant.restaurant_survey.couvert ? @restaurant.restaurant_survey.couvert : 0
 @starter_course  = @restaurant.restaurant_survey.starter_course ? @restaurant.restaurant_survey.starter_course : 0
 @presentation_course  = @restaurant.restaurant_survey.presentation_course ? @restaurant.restaurant_survey.presentation_course : 0
 @temperature  = @restaurant.restaurant_survey.temperature ? @restaurant.restaurant_survey.temperature : 0
 @quality  = @restaurant.restaurant_survey.quality ? @restaurant.restaurant_survey.quality : 0
 @baking  = @restaurant.restaurant_survey.baking ? @restaurant.restaurant_survey.baking : 0
 @harmony_ingredients  = @restaurant.restaurant_survey.harmony_ingredients ? @restaurant.restaurant_survey.harmony_ingredients : 0
 @seasoning  = @restaurant.restaurant_survey.seasoning ? @restaurant.restaurant_survey.seasoning : 0
 @dessert  = @restaurant.restaurant_survey.dessert ? @restaurant.restaurant_survey.dessert : 0
 @final_sensation_meal = @restaurant.restaurant_survey.final_sensation_meal ? @restaurant.restaurant_survey.final_sensation_meal: 0


 @establishment.final_note =  @couvert + @starter_course + @presentation_course + @temperature + @quality + @baking + @harmony_ingredients + @seasoning + @dessert + @final_sensation_meal

 @establishment.save


end

def load_restaurant
  @restaurant = Restaurant.find(params[:id])
end

def restaurant_params
  params
  .require(:restaurant)
  .permit(
    :quant_start,
    :star_hour, 
    :end_hour,
    :classification_order,
    :comment,
    :active,
    :category,
    :price_range,
    :speciality,
    :comment_hour,
    week_days: [],
    start_1: [],
    start_2: [],
    end_1: [], 
    end_2: [],
    payments_form: [],
    classification_comfort: [],
    photos:[],
    videos: [],        
    documents: [],
    icon:[],
    payment_type:[],
    environment: [],
    form_payment:[],

    establishment_attributes: [:id,
      :name,
      :active,
      :commfort_classification,
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
      :neighborhood,
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
      :establishment_open_and_close,
      :website],
      restaurant_survey_attributes: [:id,
        :couvert,
        :active,
        :starter_course,
        :presentation_course,
        :temperature,
        :quality,
        :baking,
        :harmony_ingredients,
        :seasoning,
        :final_sensation,
        :dessert,
        :final_sensation_meal,
        :active,
        :couvert_comments,
        :starter_course_comments,
        :presentation_course_comments,
        :temperature_comments,
        :quality_comments,
        :baking_comments,
        :harmony_ingredients_comments,
        :seasoning_comments,
        :final_sensation_comments,
        :dessert_comments,
        :final_sensation_meal_comments ],
        chef_attributes: [:id,:name,:active,:description,:service_time, photo:[],main_courses:[] ],
        main_courses_attributes: [:name,:active,:description, :_destroy,ingredients: [],ingredients_image: [],plate_image: [] ]
        )
end
end
