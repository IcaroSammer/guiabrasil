class Admin::EstablishmentTermsController <  Admin::BaseController
	before_action :load_establishment_term, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]

  def index
    @establishment_terms = EstablishmentTerm.all.order('name').page(params[:page] || 1).per_page(30)
  end


  def new
    @establishment_term = EstablishmentTerm.new
  end

  def create
    @establishment_term = EstablishmentTerm.new(establishment_term_params)

    if @establishment_term.save
      redirect_to admin_establishment_terms_path, notice: "Tipo de establishment_termo #{@establishment_term.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @establishment_term = EstablishmentTerm.find(params[:id])
  end


  def update
    if @establishment_term.update(establishment_term_params)
      redirect_to admin_establishment_terms_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
   
    @establishment_term.active = @establishment_term.active ? false :true
    if @establishment_term.save
       redirect_to admin_establishment_terms_path, notice: @establishment_term.active  ? 'Termo de estabelecimento ativado com sucesso' : 'Termo de estabelecimento desativado com sucesso'
    end
  end
  
  def filters
    @establishment_terms  = EstablishmentTerm.order(created_at: :desc)
    @establishment_terms  = process_filters(params, @establishment_terms ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @establishment_terms  = @establishment_terms.page(params[:page] || 1).per_page(30)
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


  
  def load_establishment_term
    @establishment_term = EstablishmentTerm.find(params[:id])
  end

  def establishment_term_params
    params
      .require(:establishment_term)
      .permit(
       :name,
    	 :active,
    	 :description ,
    	 :type_term,
    	 :publication_date,
    	 :inactivated_date,
    	 :publicated_by,
    	 :link_term,
    	 user_updater: [],
  		 dates_updater: []
          )
  end
end



