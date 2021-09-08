class Admin::RulesController < Admin::BaseController
  before_action :load_rule, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @rules = Rule.all.order('name').page(params[:page] || 1).per_page(30)
  end


  def new
    @rule = Rule.new
  end

  def create
    @rule = Rule.new(rule_params)

    if @rule.save
      redirect_to admin_rules_path, notice: "Registro #{@rule.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @rule = Rule.find(params[:id])
  end


  def update
    if @rule.update(rule_params)
      redirect_to admin_rules_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
     @rule.active = @rule.active ? false : true
    if @rule.save
       redirect_to admin_rules_path, notice: @rule.active  ? 'Registro ativado com sucesso' : 'Registro desativado com sucesso'
    end
  end
  def filters
    @rules  = Rule.order(created_at: :desc)
    @rules  = process_filters(params, @rules ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @rules  = @rules.page(params[:page] || 1).per_page(30)
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


  
  def load_rule
    @rule = Rule.find(params[:id])
  end

  def rule_params
    params
      .require(:rule)
      .permit(
        :name,
        :active,
        :order,
      )
  end
end
