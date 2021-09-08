class Admin::PriceRangesController < Admin::BaseController
	before_action :load_price_range, only: [:show, :destroy, :edit, :update]
	before_action :load_filter_fields, only: [:index, :filters]

	def index
    @price_ranges = PriceRange.all.order('range_init').page(params[:page] || 1).per_page(30)
  end


  def new
    @price_range = PriceRange.new
  end

  def create
    @price_range = PriceRange.new(price_range_params)
    fill_field_description
    
    if @price_range.save
      redirect_to admin_price_ranges_path, notice: "Registro #{@price_range.description} Criado com sucesso"
    else
      render action: :new
    end
  end

  def edit
    
  end

  def show
    @price_range = PriceRange.find(params[:id])
  end


  def update
  	fill_field_description
    if @price_range.update(price_range_params)
      redirect_to admin_price_ranges_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy 
      @price_range.active = @price_range.active ? false : true
    if @price_range.save
       redirect_to admin_price_ranges_path, notice: @price_range.active  ? 'Registro ativado com sucesso' : 'Registro desativado com sucesso'
    end
  end


  def filters
    @price_ranges  = PriceRange.order(created_at: :desc)
    @price_ranges  = process_filters(params, @price_ranges ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @price_ranges  = @price_ranges .page(params[:page] || 1).per_page(30)
        render :index
      end
    end
  end
  
  private

  def fill_field_description
    if @price_range.range_init == 0 || @price_range.range_init.nil?
      @price_range.description = " até  #{@price_range.range_end}"
    elsif @price_range.range_end == 0 || @price_range.range_end.nil?
     @price_range.description = "acima de #{@price_range.range_init} "
    else
     @price_range.description = "de #{@price_range.range_init} até  #{@price_range.range_end}"
    end
  end

  def load_filter_fields
    @filters_arr = [
      {attr: :description, type: :common},
      {attr: :active, type: :common},

    ]
  end

  def load_price_range
    @price_range = PriceRange.find(params[:id])
  end

  def price_range_params
    params
      .require(:price_range)
      .permit(
      	:range_init,
        :range_end,
        :active,
        :order,
        :description,
        business_establishment: []
      )
  end
end
