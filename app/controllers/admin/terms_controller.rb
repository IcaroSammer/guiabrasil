class Admin::TermsController <  Admin::BaseController
	before_action :load_term, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]

  def index
    @terms = Term.all.order('name').page(params[:page] || 1).per_page(30)
  end


  def new
    @term = Term.new
  end

  def create
    @term = Term.new(term_params)

    if @term.save
      redirect_to admin_terms_path, notice: "Tipo de termo #{@term.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @term = Term.find(params[:id])
  end


  def update
    if @term.update(term_params)
      redirect_to admin_terms_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
   
    @term.active = @term.active ? false :true
    if @term.save
       redirect_to admin_terms_path, notice: @term.active  ? 'Tipo de termo ativado com sucesso' : 'Tipo de termo desativado com sucesso'
    end
  end
  
  def filters
    @terms  = Term.order(created_at: :desc)
    @terms  = process_filters(params, @terms ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @terms  = @terms.page(params[:page] || 1).per_page(30)
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


  
  def load_term
    @term = Term.find(params[:id])
  end

  def term_params
    params
      .require(:term)
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


