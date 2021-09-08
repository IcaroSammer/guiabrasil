class Admin::RecreationAreasController < Admin::BaseController
	before_action :load_recreation_area, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @recreation_areas = RecreationArea.all.order('name').page(params[:page] || 1).per_page(30)
  end


  def new
    @recreationarea = RecreationArea.new
  end

  def create
    @recreationarea = RecreationArea.new(recreationarea_params)

    if @recreationarea.save
      redirect_to admin_recreation_areas_path, notice: "Registro #{@recreationarea.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @recreationarea = RecreationArea.find(params[:id])
  end


  def update
    if @recreationarea.update(recreationarea_params)
      redirect_to admin_recreation_areas_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    
    @recreationarea.active = @recreationarea.active ? false : true
    if @recreationarea.save
       redirect_to admin_recreation_areas_path, notice: @recreationarea.active ? 'Registro ativado com sucesso' : 'Registro desativado com sucesso'
    end
  end
  def filters
    @recreation_areas  = RecreationArea.order(created_at: :desc)
    @recreation_areas  = process_filters(params, @recreation_areas ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @recreation_areas  = @recreation_areas.page(params[:page] || 1).per_page(30)
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


  
  def load_recreation_area
    @recreationarea = RecreationArea.find(params[:id])
  end

  def recreationarea_params
    params
      .require(:recreation_area)
      .permit(
        :name,
        :active,
        :order,
        :description,
      )
  end
end
