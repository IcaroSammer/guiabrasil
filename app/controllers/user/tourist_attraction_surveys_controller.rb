class User::TouristAttractionSurveysController < User::BaseController

  layout "reporter"
	before_action :load_tourist_attraction_survey, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @tourist_attraction_surveys = TouristAttractionSurvey.order('survey_date').page(params[:page] || 1).per_page(30)
    if params[:tourist_attraction_id].present?
      @tourist_attraction_surveys = @tourist_attraction_surveys.where(tourist_attraction_id: params[:tourist_attraction_id]).order('survey_date').page(params[:page] || 1).per_page(30)      
    end
  end


  def new
    @tourist_attraction_survey = TouristAttractionSurvey.new
  end

  def create

    @tourist_attraction_survey = TouristAttractionSurvey.new(tourist_attraction_survey_params)

    if @tourist_attraction_survey.active == true
      TouristAttractionSurvey.where(tourist_attraction_id: @tourist_attraction_survey.tourist_attraction_id).update_all(active: 'false')
      @tourist_attraction_survey.active = true
    end

    if @tourist_attraction_survey.save
      redirect_to user_tourist_attraction_surveys_path(tourist_attraction_id: @tourist_attraction_survey.tourist_attraction_id), notice: "Registro #{@tourist_attraction_survey.survey_date} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @tourist_attraction_survey = TouristAttractionSurvey.find(params[:id])
  end


  def update

    if @tourist_attraction_survey.active == true
      TouristAttractionSurvey.where(tourist_attraction_id: @tourist_attraction_survey.tourist_attraction_id).update_all(active: 'false')
      @tourist_attraction_survey.active = true
    end

    if @tourist_attraction_survey.update_attributes(tourist_attraction_survey_params)
      redirect_to user_tourist_attraction_surveys_path(tourist_attraction_id: @tourist_attraction_survey.tourist_attraction_id), notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @tourist_attraction_survey.active = false
    if @tourist_attraction_survey.save
       redirect_to user_tourist_attraction_surveys_path(tourist_attraction_id: @tourist_attraction_survey.tourist_attraction_id), notice: 'Registro desativado com sucesso'
    end
  end
  
  def filters
    @tourist_attraction_surveys  = TouristAttractionSurvey.order(created_at: :desc)
    @tourist_attraction_surveys  = process_filters(params, tourist_attraction_surveys ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @tourist_attraction_surveys  = tourist_attraction_surveys.page(params[:page] || 1).per_page(30)
        render :index
      end
    end
  end
  
  private

  def load_filter_fields
    @filters_arr = [
      {attr: :survey_date, type: :date},
    ]
  end


  
  def load_tourist_attraction_survey
    @tourist_attraction_survey = TouristAttractionSurvey.find(params[:id])
  end

  def tourist_attraction_survey_params
    params
      .require(:tourist_attraction_survey)
      .permit(
						:survey_date,
						:final_comments ,
						:final_rate  ,
						:interest_socore  ,
						:Sort_order_by_destination_score ,
						:shopping_score ,
						:events_score ,
						:cultural_centers_score ,
						:historical_buildings_score ,
						:strong_score ,
						:churches_score ,
						:museums_score ,
						:parks_score ,
						:state_parks_score ,
						:national_parks_score ,
						:thematic_parks_score ,
						:tours_score ,
						:beaches_score ,
						:beach_tents_score ,
						:adventure_tourism_score ,
            :interest_socore_comments,
            :sort_order_by_destination_score_comments,
            :shopping_score_comments,
            :events_score_comments,
            :cultural_centers_score_comments,
            :historical_buildings_score_comments,
            :strong_score_comments,
            :churches_score_comments,
            :museums_score_comments,
            :parks_score_comments,
            :state_parks_score_comments,
            :national_parks_score_comments,
            :thematic_parks_score_comments,
            :tours_score_comments,
            :beaches_score_comments,
            :beach_tents_score_comments,
            :adventure_tourism_score_comments,
            :active,
            :signage_score,     
            :signage_score_comments,
            :conservation_score,    
            :conservation_score_comments, 
            :accessibility_score,
            :accessibility_score_comments,
            :local_tour_guides_score,   
            :local_tour_guides_score_comments,
            :kindness_score,
            :kindness_score_comments, 
            :beauty_score,
            :beauty_score_comments, 
            :infrastructure_score,
            :infrastructure_score_comments,
            :historical_importance_score,
            :historical_importance_score_comments,
            :artistic_importance_score,
            :artistic_importance_score_comments,
            :architectural_importance_score,
            :architectural_importance_score_comments,    
            :natural_importance_score,
            :natural_importance_score_comments,    
            :cultural_importance_score,
            :cultural_importance_score_comments,    
            :economic_importance_score,
            :economic_importance_score_comments,
            :tourist_attraction_id,    
      )
  end
end
