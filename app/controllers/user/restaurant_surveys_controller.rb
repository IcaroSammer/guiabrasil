class User::RestaurantSurveysController < User::BaseController
  before_action :load_restaurant_survey, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @restaurant_surveys = RestaurantSurvey.all.page(params[:page] || 1).per_page(30)
  end


  def new
    @restaurant_survey = RestaurantSurvey.new
  end

  def create
    @restaurant_survey = RestaurantSurvey.new(restaurant_survey_params)

    if @restaurant_survey.save
      redirect_to user_restaurant_surveys_path, notice: "Registro Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @restaurant_survey = RestaurantSurvey.find(params[:id])
  end


  def update
    if @restaurant_survey.update_attributes(restaurant_survey_params)
      redirect_to user_restaurant_surveys_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @restaurant_survey.active = false
    if @restaurant_survey.save
       redirect_to user_restaurant_surveys_path, notice: 'Registro desativado com sucesso'
    end
  end
  def filters
    @restaurant_surveys  = RestaurantSurvey.order(created_at: :desc)
    @restaurant_surveys  = process_filters(params, @restaurant_surveys ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @restaurant_surveys  = @restaurant_surveys.page(params[:page] || 1).per_page(30)
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


  
  def load_restaurant_survey
    @restaurant_survey = RestaurantSurvey.find(params[:id])
  end

  def restaurant_survey_params
    params
      .require(:restaurant_survey)
      .permit(
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
        :final_sensation_meal_comments,
      )
  end
end
