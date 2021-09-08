class Admin::OccupationsController < Admin::BaseController

  before_action :load_occupation, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]
    
  def index
    @occupations =Occupation.order('created_at').page(params[:page] || 1).per_page(30)
  end

  def new
    @occupation =Occupation.new
  end

  def create
    @occupation =Occupation.new(occupation_params)

    if @occupation.save
      redirect_to admin_occupations_path, notice: "Registro #{@occupation.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @occupation = Occupation.find(params[:id])
  end

  def update
    if @occupation.update_attributes(occupation_params)
      redirect_to admin_occupations_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
      @occupation.active = @occupation.active ? false : true
    if @occupation.save
        redirect_to admin_occupation_path, notice: @occupation.active  ? 'Registro ativado com sucesso' : 'Registro desativado com sucesso'
    end
  end

  def filters
    @occupations  = Occupation.order(created_at: :desc)
    @occupations  = process_filters(params, @occupations ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @occupations  = @occupations.page(params[:page] || 1).per_page(30)
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
  
  def load_occupation
    @occupation = Occupation.find(params[:id])
  end

  def occupation_params
    params
      .require(:occupation)
      .permit(
        :name,
        :description,
        :active,
      )
  end
    
  
    




end
