class Customer::ProfilesController < Customer::BaseController
	before_action :load_profile, only: [:show, :destroy, :edit, :update]



	def create
		@profile = Profile.new(profile_params)

		if @profile.save
			redirect_to admin_icons_path, notice: "Registro #{@profile.name} Criado com sucesso"
		else
			render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
		end
	end
	def edit 


	end 
	def show
		@profile = Profile.find(params[:id])
	end 

	def update

		if @profile.update(profile_params)
			redirect_to root_path, notice: 'Atualizado com sucesso'
		else
			render action: :edit, notice: 'Falha na atualização'
		end
	end

	def destroy
		@profile.destroy

		redirect_to root_path, notice: 'Removido com sucesso'
	end  

	private

	def load_profile
	
		if current_customer.profile.present? 
			@profile = current_customer.profile
		else
			@profile = Profile.create(customer_id: current_customer.id )

		end
		
	end

	def profile_params
		params
		.require(:profile)
		.permit(
			:name,
			:mobile_phone_number,
			:contact_by_whats_app,
			:active,
			:instagram,
			:facebook,
			:twitter,
			:linkedin,
			:user_type,
			:cpf,
			:rg_rne,
			:nacionality,
			:zip_code,
			:address,
			:neighbohood,
			:address_complement,
			:address_number,
			:city,
			:state,
			:country,
			:birthday,
			:gender,
			:customer_id)
	end
end