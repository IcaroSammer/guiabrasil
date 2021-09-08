class User::ChefsController < User::BaseController

  before_action :load_chef, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @chefs = Chef.all.order('name').page(params[:page] || 1).per_page(30)
  end


  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)

    if @chef.save
      redirect_to user_chefs_path, notice: "Registro #{@chef.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @chef = Chef.find(params[:id])
  end


  def update
    if @chef.update_attributes(chef_params)
       @chef = Chef.find(params[:id])
      redirect_to user_chefs_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @chef.active = false
    if @chef.save
       redirect_to user_chefs_path, notice: 'Registro desativado com sucesso'
    end
  end
  def filters
    @chefs  = Chef.order(created_at: :desc)
    @chefs  = process_filters(params, @chefs ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @chefs  = @chefs.page(params[:page] || 1).per_page(30)
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


  
  def load_chef
    @chef = Chef.find(params[:id])
  end

  def chef_params
    params
      .require(:chef)
      .permit(
        :name,
        :active,
        :description,
        :service_time,
        main_courses:[],
        photos:[],
        videos: [],
      )
  end
end
