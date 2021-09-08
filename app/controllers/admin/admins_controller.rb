class Admin::AdminsController < Admin::BaseController

before_action :load_admin, only: [:show, :destroy, :edit, :update]
before_action :load_filter_fields, only: [:index, :filters]
	

  def index
    @admins = Admin.all.order('email').page(params[:page] || 1).per_page(30)
  end


  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to admin_admins_path, notice: 'Criado com sucesso'
    else
      render action: :new
    end
  end

  def edit
    
  end

  def show
    @admin = Admin.find(params[:id])
  end


  def update

    if params[:admin][:password].present?
      if @admin.update_attributes(admin_params_without_password)
        redirect_to admin_admins_path, notice: 'Atualizado com sucesso'
      else
        render action: :edit
      end        
    elsif params[:admin][:profile_id].present?
      if @admin.update_attributes(admin_params_without_profile)
        redirect_to admin_admins_path, notice: 'Atualizado com sucesso'
      else
        render action: :edit
      end
    else
      if @admin.update_attributes(admin_params)
        redirect_to admin_admins_path, notice: 'Atualizado com sucesso'
      else
        render action: :edit
      end
    end

  end

  def destroy
    
    @admin.destroy

    redirect_to admin_admins_path, notice: 'Removido com sucesso'
  end


  def filters
    @admins = Admin.order(created_at: :desc)
    @admins = process_filters(params, @admins) if params[:query].present?

    respond_to do |format|
      format.html do 
        @admins = @admins.page(params[:page] || 1).per_page(30)
        render :index
      end
    end
  end
  
  private

  def load_filter_fields
    @filters_arr = [
      {attr: :email, type: :common},
    ]
  end

  def load_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params
      .require(:admin)
      .permit(
        :email,
        :password,
        :password_confirmation,
        :name,
        :phone_number,
        :photo
      )        
      
  end

  def admin_params_without_password
    params
      .require(:admin)
      .permit(
        :email,
        :name,
        :phone_number,
        :photo
      )        
  end

  def admin_params_without_profile
    params
      .require(:admin)
      .permit(
        :email,
        :password,
        :password_confirmation,
        :name,
        :phone_number,
        :photo
      
      )
  end

end
