class Admin::TypeTermsController < Admin::BaseController
	before_action :load_type_term, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]

  def index
    @type_terms = TypeTerm.all.order('name').page(params[:page] || 1).per_page(30)
  end


  def new
    @type_term = TypeTerm.new
  end

  def create
    @type_term = TypeTerm.new(type_term_params)

    if @type_term.save
      redirect_to admin_type_terms_path, notice: "Tipo de termo #{@type_term.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @type_term = TypeTerm.find(params[:id])
  end


  def update
    if @type_term.update(type_term_params)
      redirect_to admin_type_terms_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
   
    @type_term.active = @type_term.active ? false :true
    if @type_term.save
       redirect_to admin_type_terms_path, notice: @type_term.active  ? 'Tipo de termo ativado com sucesso' : 'Tipo de termo desativado com sucesso'
    end
  end
  
  def filters
    @type_terms  = TypeTerm.order(created_at: :desc)
    @type_terms  = process_filters(params, @type_terms ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @type_terms  = @type_terms.page(params[:page] || 1).per_page(30)
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


  
  def load_type_term
    @type_term = TypeTerm.find(params[:id])
  end

  def type_term_params
    params
      .require(:type_term)
      .permit(
         :name,
    	 :active,
    	 :description,
          )
  end
end




