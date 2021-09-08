class Admin::BookingPoliciesController < Admin::BaseController
	before_action :load_booking_policy, only: [:show, :destroy, :edit, :update]
	before_action :load_filter_fields, only: [:index, :filters]


	def index
		@booking_policies = BookingPolicy.all.order('name').page(params[:page] || 1).per_page(30)
	end


	def new
		@booking_policy = BookingPolicy.new
	end

	def create
		@booking_policy = BookingPolicy.new(booking_policy_params)

		if @booking_policy.save
			redirect_to admin_booking_policies_path, notice: "Registro #{@booking_policy.name} Criado com sucesso"
		else
			render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
		end
	end

	def edit
		
	end

	def show
		@booking_policy = BookingPolicy.find(params[:id])
	end


	def update

		if @booking_policy.update(booking_policy_params)
			redirect_to admin_booking_policies_path, notice: 'Atualizado com sucesso'
		else
			render action: :edit
		end
	end

	def destroy
		
		@booking_policy.active = @booking_policy.active ? false : true
		if @booking_policy.save
			redirect_to admin_booking_policies_path, notice: @booking_policy.active ? 'Registro ativado com sucesso' : 'Registro desativado com sucesso'
		end
	end
	
	def filters
		@booking_policies  = BookingPolicy.order(created_at: :desc)
		@booking_policies  = process_filters(params, @booking_policies ) if params[:query].present?

		respond_to do |format|
			format.html do 
				@booking_policies  = @booking_policies.page(params[:page] || 1).per_page(30)
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


	
	def load_booking_policy
		@booking_policy = BookingPolicy.find(params[:id])
	end

	def booking_policy_params
		params
		.require(:booking_policy)
		.permit(
			:name,
			:active,
			:description,
			business_establishment:[],
			)
	end
end
