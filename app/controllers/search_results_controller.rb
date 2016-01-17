class SearchResultsController < ApplicationController
  include JobQueue
  before_action :filter_params, only: :searching
  before_action :find_queue, only: :searching
  
  def searching
    create_search
    
    if @search.errors.any?
      render 'search_errors'
    else
      @progress_status = ProgressStatus.create!(percent: 0)
      session[:search_params] = @search
      session[:progress_id] = @progress_status.id
      @queue.push(@progress_status)
    end
  end

  def show
    search = session[:search_params]
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
