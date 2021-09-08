class User::SpecialitiesController < User::BaseController
  before_action :load_speciality, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @specialities = Speciality.all.order('name').page(params[:page] || 1).per_page(30)
  end


  def new
    @speciality = Speciality.new
  end

  def create
    @speciality = Speciality.new(speciality_params)

    if @speciality.save
      redirect_to user_specialities_path, notice: "Registro #{@speciality.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @speciality = Speciality.find(params[:id])
  end


  def update
    if @speciality.update_attributes(speciality_params)
      redirect_to user_specialities_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @speciality.active = false
    if @speciality.save
       redirect_to user_specialities_path, notice: 'Registro desativado com sucesso'
    end
  end
  def filters
    @specialities  = Speciality.order(created_at: :desc)
    @specialities  = process_filters(params, @specialities ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @specialities  = @specialities.page(params[:page] || 1).per_page(30)
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


  
  def load_speciality
    @speciality = Speciality.find(params[:id])
  end

  def speciality_params
    params
      .require(:speciality)
      .permit(
        :name,
        :active,
        :description,
        :image,
      )
  end
end
