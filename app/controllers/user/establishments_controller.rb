class User::EstablishmentsController < User::BaseController
  before_action :load_establishment, except: [:address_infos, :destroy]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @establishments = Establishment.all.order('updated_at').page(params[:page] || 1).per_page(30)
  end


  def new
    @establishment = Establishment.new
  end

  def create
    @establishment = Establishment.new(establishment_params)

    if @establishment.save

      redirect_to user_establishments_path, notice: "Registro #{@establishment.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @establishment = Establishment.find(params[:id])
  end


  def update
    
    if @establishment.update_attributes(establishment_params)
      
      redirect_to user_establishments_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @establishment.active = false
    if @establishment.save
      
      redirect_to user_establishments_path, notice: 'Registro desativado com sucesso'
    end
  end

  def address_infos
    manager = CepManager.new(params[:cep])

    begin
      manager = manager.process
      render status: 200, json: manager.to_json
    rescue
      render status: 422
    end
  end


  def filters
    @establishments  = Establishment.order(created_at: :desc)
    @establishments  = process_filters(params, @establishments ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @establishments  = @establishments.page(params[:page] || 1).per_page(30)
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


  
  def load_establishment
    @establishment = Establishment.find(params[:id])
  end

  def establishment_params
    params
      .require(:establishment)
      .permit(
        :name,
        :active,
        :environment,
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
        :facebook,
        :linkedin,
        :twitter,
        :instagram,
        :website,
        business_establishment: [],
      )
  end
end
require 'correios-cep'


