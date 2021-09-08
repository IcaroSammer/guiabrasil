class User::PublicationsController < User::BaseController
  before_action :load_publication, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @publications = Publication.all.page(params[:page] || 1).per_page(30)
  end


  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.new(publication_params)
    
    if @publication.save
      redirect_to user_publications_path, notice: "Registro Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @publication = Publication.find(params[:id])
  end


  def update
    if @publication.update_attributes(publication_params)
      redirect_to user_publications_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @publication.active = false
    if @publication.save
       redirect_to user_publications_path, notice: 'Registro desativado com sucesso'
    end
  end
  def filters
    @publications  = Publication.order(created_at: :desc)
    @publications  = process_filters(params, @publications ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @publications  = @publications.page(params[:page] || 1).per_page(30)
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


  
  def load_publication
    @publication = Publication.find(params[:id])
  end

  def publication_params
    params
      .require(:publication)
      .permit(
        :name,
        :description,
        :active,
        :establishment_id,
        images: [],
        tag: [],
        videos: [],
        
      )
  end
end
