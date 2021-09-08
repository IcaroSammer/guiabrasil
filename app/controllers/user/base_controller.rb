class User::BaseController < ApplicationController
  layout "reporter"
  before_action :authenticate_user!
  

  def authenticated_user
    current_user
  end

   
 def process_filters(params, resources)
    @resources = resources

    filters_groups = @filters_arr.group_by{ |filter| filter[:type] }
    filter_by_type filters_groups

    @resources
  end

  def filter_by_type filter
    filter_commons  filter[:common] if filter[:common].present?
    filter_nesteds  filter[:nested] if filter[:nested].present?
    filter_commons  filter[:select] if filter[:select].present?
    filter_dates    filter[:date]   if filter[:date].present?
    filter_floats   filter[:float]  if filter[:float].present?
  end

  def filter_commons commons
    commons.each do |common|
      @resources = @resources.where("LOWER (#{common[:attr].to_s}) LIKE LOWER(?)"  , "%#{params[:query][common[:attr]]}%") if params[:query][common[:attr]].present?      
    end 
  end

  def filter_dates dates
    dates.each do |date|
      @resources = @resources.where(date[:attr] => [params[:query][date[:attr]][:from].to_date.beginning_of_day..params[:query][date[:attr]][:to].to_date.end_of_day]) if params[:query][date[:attr]].present? && params[:query][date[:attr]][:to].present? && params[:query][date[:attr]][:from].present?
    end
  end

  def filter_nesteds nesteds
    nesteds.each do |nested|
      @resources = @resources.joins(nested[:nested_class]).where("LOWER(#{nested[:nested_class].to_s.pluralize}.#{nested[:nested_attr]}) LIKE LOWER(?)", "%#{params[:query][nested[:attr]]}%") if params[:query][nested[:attr]].present?
    end
  end

  def filter_floats floats
    floats.each do |float|
      @resources = @resources.where(float[:attr] => params[:query][float[:attr]].to_f) if params[:query][float[:attr]].present?
    end
  end

end
