class Admin::SocialItemsController < Admin::BaseController
  before_action :load_social_item, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @social_items = SocialItem.all.order('name').page(params[:page] || 1).per_page(30)
  end


  def new
    @socialitem = SocialItem.new
  end

  def create
    @socialitem = SocialItem.new(socialitem_params)

    if @socialitem.save
      redirect_to admin_social_items_path, notice: "Registro #{@socialitem.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @socialitem = SocialItem.find(params[:id])
  end


  def update
    if @socialitem.update(socialitem_params)
      redirect_to admin_social_items_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @socialitem.active = @socialitem.active ? false : true
    if @socialitem.save
       redirect_to admin_social_items_path, notice: @socialitem.active ? 'Registro ativado com sucesso' : 'Registro desativado com sucesso'
    end
  end
  def filters
    @social_items  = SocialItem.order(created_at: :desc)
    @social_items  = process_filters(params, @social_items ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @social_items  = @social_items.page(params[:page] || 1).per_page(30)
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


  
  def load_social_item
    @socialitem = SocialItem.find(params[:id])
  end

  def socialitem_params
    params
      .require(:social_item)
      .permit(
        :name,
        :active,
        :description,
        :order,
      )
  end
end
