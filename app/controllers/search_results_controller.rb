class SearchResultsController < ApplicationController
  before_action :filter_params, only: :searching
  
  def searching
    create_search
    
    if @search.errors.any?
      render 'search_errors'
    else
      progress_status = ProgressStatus.new
      thr = Thread.new(progress_status) do |current_progress|
        Thread.current["progress"] = current_progress
        10.times do |i|
          sleep(1)
          current_progress.percent = (i+1) * 10
          Thread.current["progress"] = current_progress
        end
      end
      @index = thr.object_id
      session["#{@index}"] = @search
    end
  end

  def show
    search = session["#{params[:search_id]}"]
    @search_result = Array.new
    @search_result = Flight.find_by( destination: search["to_location"], origin: search["from_location"], date_of_journey: search["date_of_journey"])
  end

  private
  def create_search
    @search = Search.new
    @search.from_location = params[:from_location]
    @search.to_location = params[:to_location]
    begin
      @search.date_of_journey = Date.strptime(params[:date_of_journey], '%d/%m/%Y')
    rescue ArgumentError
      @search.errors[:date_of_journey] << 'Invalid date'
    end
    @search.one_way = params.keys.include?(:one_way)
    @search.valid?
  end

  def filter_params
    params.require(:from_location)
    params.require(:to_location)
    params.require(:date_of_journey)
    params.permit(:one_way)
  end
end
