class Admin::IconsController < Admin::BaseController
  before_action :load_icon, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @icons = Icon.all.order('name').page(params[:page] || 1).per_page(30)
  end


  def new
    @icon = Icon.new
  end

  def create
    @icon = Icon.new(icon_params)

    if @icon.save
      redirect_to admin_icons_path, notice: "Registro #{@icon.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @icon = Icon.find(params[:id])
  end


  def update
    if @icon.update(icon_params)
      redirect_to admin_icons_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @icon.active = @icon.active ? false : true
    if @icon.save
       redirect_to admin_icons_path, notice: @icon.active ? 'Registro ativado com sucesso' : 'Registro desativado com sucesso'
    end
  end
  def filters
    @icons  = Icon.order(created_at: :desc)
    @icons  = process_filters(params, @icons ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @icons  = @icons.page(params[:page] || 1).per_page(30)
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


  
  def load_icon
    @icon = Icon.find(params[:id])
  end

  def icon_params
    params
      .require(:icon)
      .permit(
        :name,
        :active,
        :description,
        :image,
        :order,
        business_establishment:[],
      )
  end
end
