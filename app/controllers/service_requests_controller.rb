class ServiceRequestsController < ApplicationController
  before_action :set_service_request, only: [:show, :edit, :update, :destroy]

  # GET /service_requests
  # GET /service_requests.json
  def index
    @hospital = Hospital.find(params[:hospital_id])
    @service_requests = @hospital.service_request.all
  end

  # GET /service_requests/1
  # GET /service_requests/1.json
  def show
  end

  # GET /service_requests/new
  def new
    @service_request = ServiceRequest.new
  end

  # GET /service_requests/1/edit
  def edit
  end

  # POST /service_requests
  # POST /service_requests.json
  def create
    @service_request = ServiceRequest.new(service_request_params)
    @service_request.created_at = Time.now
    respond_to do |format|
      if @service_request.save
        format.html { redirect_to hospital_service_requests_path, notice: 'Service request was successfully created.' }
        format.json { render :show, status: :created, location: hospital_service_requests_path }
      else
        format.html { render :new }
        format.json { render json: @service_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_requests/1
  # PATCH/PUT /service_requests/1.json


  # DELETE /service_requests/1
  # DELETE /service_requests/1.json
  def destroy
    @service_request.destroy
    respond_to do |format|
      format.html { redirect_to service_requests_url, notice: 'Service request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_request
      @service_request = ServiceRequest.find(params[:id])
      @hospital = Hospital.find(params[:hospital_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_request_params
      params.require(:service_request).permit(:id,:hospital_id,:time,:sp_type)
    end
    def approve
      @service_request = ServiceRequest.find(params[:id])
      @service_request.status = :approve
      @hospital = @service_request.hospital
      @hospital.service_pack.sp_type = @service_request.sp_type
      if (@hospital.service_pack.due_date)
        @hospital.service_pack.due_date = @hospital.service_pack.due_date + @service_request.time.days
      else
        @hospital.service_pack.due_date = Time.now + @service_request.time.days
      end
      @service_request.replied_at = Time.now
      p 'HHHHHHHH'
      @service_request.save
      @hospital.save

    end
end
