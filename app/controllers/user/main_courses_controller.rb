class User::MainCoursesController < User::BaseController

  before_action :load_main_course, only: [:show, :destroy, :edit, :update]
  before_action :load_filter_fields, only: [:index, :filters]


  def index
    @main_courses = MainCourse.all.order('name').page(params[:page] || 1).per_page(30)
  end


  def new
    @main_course = MainCourse.new
  end

  def create
    @main_course = MainCourse.new(main_course_params)

    if @main_course.save
      redirect_to user_main_courses_path, notice: "Registro #{@main_course.name} Criado com sucesso"
    else
      render action: :new, notice: 'Um erro ocorreu durante a gravação do registro, verifique os campos e tente novamente.'
    end
  end

  def edit
    
  end

  def show
    @main_course = MainCourse.find(params[:id])
  end


  def update
    if @main_course.update_attributes(main_course_params)
      redirect_to user_main_courses_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @main_course.active = false
    if @main_course.save
       redirect_to user_main_courses_path, notice: 'Registro desativado com sucesso'
    end
  end
  def filters
    @main_courses  = MainCourse.order(created_at: :desc)
    @main_courses  = process_filters(params, @main_courses ) if params[:query].present?

    respond_to do |format|
      format.html do 
        @main_courses  = @main_courses.page(params[:page] || 1).per_page(30)
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


  
  def load_main_course
    @main_course = MainCourse.find(params[:id])
  end
  def model_params  
    params.require(:ingredients).permit(:attribute1, :attribute2, ingredients: [])
  end

  def main_course_params
    params
      .require(:main_course)
      .permit(
        :name,
        :active,
        :description,
        ingredients: [],
        ingredients_image: [],
        plate_image: [],
      )
  end
end
