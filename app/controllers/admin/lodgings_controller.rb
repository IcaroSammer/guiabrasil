class Admin::LodgingsController < Admin::BaseController
  before_action :load_lodging, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @lodgings = Lodging.all.order('name').page(params[:page] || 1).per_page(30)
  end


  def new
    @lodging = Lodging.new
  end

  def create
    @lodging = Lodging.new(lodging_params)

    if @lodging.save
      redirect_to admin_lodgings_path, notice: "Registro #{@lodging.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @lodging = Lodging.find(params[:id])
  end


  def update
    if @lodging.update(lodging_params)
      redirect_to admin_lodgings_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    
    @lodging.active = @lodging.active ? false : true
    if @lodging.save
       redirect_to admin_lodgings_path, notice: @lodging.active ? 'Registro ativado com sucesso' : 'Registro desativado com sucesso'
    end
  end
  def filters
    @lodgings  = Lodging.order(created_at: :desc)
    @lodgings  = process_filters(params, @lodgings ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @lodgings  = @lodgings.page(params[:page] || 1).per_page(30)
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


  
  def load_lodging
    @lodging = Lodging.find(params[:id])
  end

  def lodging_params
    params
      .require(:lodging)
      .permit(
        :name,
        :active,
        :description,
        :order,
      )
  end
end
