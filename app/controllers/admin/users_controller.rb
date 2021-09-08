class Admin::UsersController < Admin::BaseController
	
before_action :load_user, only: [:show, :destroy, :edit, :update]
before_action :load_filter_fields, only: [:index, :filters]
	

  def index
    @users = User.all.order('email').page(params[:page] || 1).per_page(30)
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_users_path, notice: 'Criado com sucesso'
    else
      render action: :new
    end
  end

  def edit
    
  end

  def show
    @user = User.find(params[:id])
  end


  def update

    if params[:user][:password].present?
      if @user.update(user_params_without_password)
        redirect_to user_users_path, notice: 'Atualizado com sucesso'
      else
        render action: :edit
      end        
    elsif params[:user][:profile_id].present?
      if @user.update_attributes(user_params_without_profile)
        redirect_to user_users_path, notice: 'Atualizado com sucesso'
      else
        render action: :edit
      end
    else
      if @user.update_attributes(user_params)
        redirect_to user_users_path, notice: 'Atualizado com sucesso'
      else
        render action: :edit
      end
    end

  end

  def destroy
    @user.destroy

    redirect_to user_users_path, notice: 'Removido com sucesso'
  end


  def filters
    @users = User.order(created_at: :desc)
    @users = process_filters(params, @users) if params[:query].present?

    respond_to do |format|
      format.html do 
        @users = @users.page(params[:page] || 1).per_page(30)
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

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params
      .require(:user)
      .permit(
        :email,
        :password,
        :password_confirmation,
        :name,
        :phone_number,
        :photo
      )
  end

  def user_params_without_password
    params
      .require(:user)
      .permit(
        :email,
        :name,
        :phone_number,
        :photo
      )
  end

  def user_params_without_profile
    params
      .require(:user)
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
