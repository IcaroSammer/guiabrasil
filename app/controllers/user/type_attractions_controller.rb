class User::TypeAttractionsController < User::BaseController
  before_action :load_type_attraction, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @type_attractions = TypeAttraction.all.order('name').page(params[:page] || 1).per_page(30)
  end


  def new
    @type_attraction = TypeAttraction.new
  end

  def create
    @type_attraction = TypeAttraction.new(type_attraction_params)

    if @type_attraction.save
      City.create(establishment_id:  @type_attraction.establishment.id, city: @type_attraction.establishment.city, state:  @type_attraction.establishment.state)
      redirect_to user_type_attractions_path, notice: "Registro #{@type_attraction.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @type_attraction = TypeAttraction.find(params[:id])
  end


  def update
    if @type_attraction.update_attributes(type_attraction_params)
      redirect_to user_type_attractions_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @type_attraction.active = false
    if @type_attraction.save
       redirect_to user_type_attractions_path, notice: 'Registro desativado com sucesso'
    end
  end
  def filters
    @type_attractions  = TypeAttraction.order(created_at: :desc)
    @type_attractions  = process_filters(params, @type_attractions ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @type_attractions  = @type_attractions.page(params[:page] || 1).per_page(30)
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


  
  def load_type_attraction
    @type_attraction = TypeAttraction.find(params[:id])
  end

  def type_attraction_params
    params
      .require(:type_attraction)
      .permit(
        :name,
        :active,
        photos: [],
      )
  end
end
