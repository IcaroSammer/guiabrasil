class Admin::FurnituresController < Admin::BaseController
	before_action :load_furniture, except: [:index, :new, :create]

	def index
    @furnitures = Furniture.order('name').page(params[:page] || 1).per_page(30)
  end

 	def new
    @furniture = Furniture.new
 	end

 	def create
    @furniture = Furniture.new(furniture_params)
		  
		if @furniture.save
	    redirect_to admin_furnitures_path, notice: 'Criado com sucesso'
	  else
	    render action: :new
	  end
  end

 	def edit
  end

  def update
    if @furniture.update_attributes(furniture_params)
      redirect_to admin_furnitures_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

	def destroy
    @furniture.destroy

    redirect_to admin_furnitures_path, notice: 'Removido com sucesso'
  end 

  def show

  end 

  private

  def load_furniture
    @furniture = Furniture.find(params[:id])
  end

  def furniture_params
    params
      .require(:furniture)
      .permit(
        :name,
        :description,
        :dimension,
        :rooms,
      )
  end
end
