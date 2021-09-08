class Admin::RoomsController < Admin::BaseController

	before_action :load_room, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @rooms =Room.order('created_at').page(params[:page] || 1).per_page(30)
  end


  def new
    @room =Room.new
  end

  def create
    @room =Room.new(room_params)

    if @room.save
      redirect_to admin_rooms_path, notice: "Registro #{@room.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @room = Room.find(params[:id])
  end


  def update
    if @room.update_attributes(room_params)
      redirect_to admin_rooms_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
      @room.active = @room.active ? false : true
    if @room.save
       redirect_to admin_room_path, notice: @room.active  ? 'Registro ativado com sucesso' : 'Registro desativado com sucesso'
    end
  end

  def filters
    @rooms  = Room.order(created_at: :desc)
    @rooms  = process_filters(params, @rooms ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @rooms  = @rooms.page(params[:page] || 1).per_page(30)
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
  
  def load_room
   @room = Room.find(params[:id])
  end

  def room_params
    params
      .require(:room)
      .permit(
        :name,
        :description,
        :active,
      )
  end

end
