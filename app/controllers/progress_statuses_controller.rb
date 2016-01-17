class ProgressStatusesController < ApplicationController
  before_action :set_progress_status, only: [:show, :edit, :update, :destroy]

  # GET /progress_statuses
  # GET /progress_statuses.json
  def index
    @progress_statuses = ProgressStatus.all
  end

  # GET /progress_statuses/1
  # GET /progress_statuses/1.json
  def show
    @progress_status = ProgressStatus.find(params[:id])
    render json: @progress_status
  end

  # GET /progress_statuses/new
  def new
    @progress_status = ProgressStatus.new
  end

  # GET /progress_statuses/1/edit
  def edit
  end

  # POST /progress_statuses
  # POST /progress_statuses.json
  def create
    @progress_status = ProgressStatus.new(progress_status_params)

    respond_to do |format|
      if @progress_status.save
        format.html { redirect_to @progress_status, notice: 'Progress status was successfully created.' }
        format.json { render :show, status: :created, location: @progress_status }
      else
        format.html { render :new }
        format.json { render json: @progress_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /progress_statuses/1
  # PATCH/PUT /progress_statuses/1.json
  def update
    respond_to do |format|
      if @progress_status.update(progress_status_params)
        format.html { redirect_to @progress_status, notice: 'Progress status was successfully updated.' }
        format.json { render :show, status: :ok, location: @progress_status }
      else
        format.html { render :edit }
        format.json { render json: @progress_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /progress_statuses/1
  # DELETE /progress_statuses/1.json
  def destroy
    @progress_status.destroy
    respond_to do |format|
      format.html { redirect_to progress_statuses_url, notice: 'Progress status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_progress_status
      @progress_status = ProgressStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def progress_status_params
      params.require(:progress_status).permit(:percent)
    end
end
