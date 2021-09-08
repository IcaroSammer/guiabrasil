class Admin::StructuresController < Admin::BaseController
  before_action :load_structure, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @structures = Structure.all.order('name').page(params[:page] || 1).per_page(30)
  end


  def new
    @structure = Structure.new
  end

  def create
    @structure = Structure.new(structure_params)

    if @structure.save
      redirect_to admin_structures_path, notice: "Registro #{@structure.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @structure = Structure.find(params[:id])
  end


  def update
    if @structure.update(structure_params)
      redirect_to admin_structures_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @structure.active = @structure.active ? false : true
    if @structure.save
       redirect_to admin_structures_path, notice: @structure.active ? 'Registro ativado com sucesso' : 'Registro desativado com sucesso'
    end
  end
  def filters
    @structures  = Structure.order(created_at: :desc)
    @structures  = process_filters(params, @structures ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @structures  = @structures.page(params[:page] || 1).per_page(30)
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


  
  def load_structure
    @structure = Structure.find(params[:id])
  end

  def structure_params
    params
      .require(:structure)
      .permit(
        :name,
        :active,
        :order,
      )
  end
end
