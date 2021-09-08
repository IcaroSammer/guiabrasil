class User::HotelSurveysController < User::BaseController
	before_action :load_hotel_survey, only: [:show, :destroy, :edit, :update]
	before_action :load_filter_fields, only: [:index, :filters]


	def index
		@hotel_surveys = HotelSurvey.all.page(params[:page] || 1).per_page(30)
	end


	def new
		@hotel_survey = HotelSurvey.new
	end

	def create
		@hotel_survey = HotelSurvey.new(survey_hotel_params)

		if @hotel_survey.save
			redirect_to user_hotel_surveys_path, notice: "Registro Criado com sucesso"
		else
			render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
		end
	end

	def edit
		
	end

	def show
		@hotel_survey = HotelSurvey.find(params[:id])
	end


	def update
		if @hotel_survey.update_attributes(survey_hotel_params)
			redirect_to user_hotel_surveys_path, notice: 'Atualizado com sucesso'
		else
			render action: :edit, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
		end
	end

	def destroy
		@hotel_survey.active = false
		if @hotel_survey.save
			redirect_to user_hotel_surveys_path, notice: 'Registro desativado com sucesso'
		end
	end
	def filters
		@hotel_surveys  = HotelSurvey.order(created_at: :desc)
		@hotel_surveys  = process_filters(params, @hotel_surveys ) if params[:query].present?

		respond_to do |format|
			format.html do 
				@hotel_surveys  = @hotel_surveys.page(params[:page] || 1).per_page(30)
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


	
	def load_hotel_survey
		@hotel_survey = HotelSurvey.find(params[:id])
	end

	def survey_hotel_params
		params
		.require(:hotel_survey)
		.permit(
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
					)
	end


end
