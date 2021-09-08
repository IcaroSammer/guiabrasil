class Admin::AccommodationItemsController < Admin::BaseController
  before_action :load_accommodation_item, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @accommodation_items = AccommodationItem.all.order('name').page(params[:page] || 1).per_page(30)
  end


  def new
    @accommodationitem = AccommodationItem.new
  end

  def create
    @accommodationitem = AccommodationItem.new(accommodationitem_params)

    if @accommodationitem.save
      redirect_to admin_accommodation_items_path, notice: "Registro #{@accommodationitem.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @accommodationitem = AccommodationItem.find(params[:id])
  end


  def update
    if @accommodationitem.update(accommodationitem_params)
      redirect_to admin_accommodation_items_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @accommodationitem.active = @accommodationitem.active ? false : true
    if @accommodationitem.save
       redirect_to admin_accommodation_items_path, notice: @accommodationitem.active ? 'Registro ativado com sucesso' : 'Registro desativado com sucesso'
    end
  end
  def filters
    @accommodation_items  = AccommodationItem.order(created_at: :desc)
    @accommodation_items  = process_filters(params, @accommodation_items ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @accommodation_items  = @accommodation_items.page(params[:page] || 1).per_page(30)
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


  
  def load_accommodation_item
    @accommodationitem = AccommodationItem.find(params[:id])
  end

  def accommodationitem_params
    params
      .require(:accommodation_item)
      .permit(
        :name,
        :active,
        :order,
      )
  end
end
