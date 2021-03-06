class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  require "benchmark"
  # GET /patients
  # GET /patients.json
  def index
    authorize! :read, @patient
    if params[:search].blank?
      # @patients = Patient.all
      @count = Patient.all.count
      @patients = Patient.all.paginate(:page => params[:page], :per_page => 15)
      @time = Benchmark.realtime do
        @count = Patient.all.count
      end
    else
      # @patients = Patient.search(params[:search])
      @time = Benchmark.realtime do
        @count =  Patient.search(params[:search]).count
    end

      @patients = Patient.search(params[:search]).paginate(:page =>params[:page], :per_page => 15)
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    authorize! :read, @patient
    @medical_records = @patient.medical_records
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)
    # Patient.cre
    @patient.email = patient_params[:id] + "@emed.com"
    @patient.password = "123456"
    @patient.password_confirmation = "123456"
    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:name, :dob, :job, :ethnic, :oversea, :address, :workplace, :id, :gender, :phone)
    end
end
