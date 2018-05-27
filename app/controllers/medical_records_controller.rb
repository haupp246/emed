class MedicalRecordsController < ApplicationController
  require "benchmark"
  before_action :set_medical_record, only: [:show, :edit, :update, :destroy]

  # GET /medical_records
  # GET /medical_records.json
  def index
   authorize! :read, @medical_record
    @template ||= MedicalRecordTemplate.find(params[:medical_record_template_id])
  
    if params[:search].blank?
      # @patients = Patient.all
      @time = Benchmark.measure do
        @count = @template.medical_record.all.count
      end
      @medical_records = @template.medical_record.all.paginate(:page => params[:page], :per_page => 15) 
      # @patients = Patient.all.paginate(:page => params[:page], :per_page => 15) 
    else
      # @patients = Patient.search(params[:search])
      @time = Benchmark.measure do
      @count = @template.medical_record.search(params[:search]).count
      end
     @medical_records = @template.medical_record.search(params[:search]).paginate(:page => params[:page], :per_page => 15) 
    end
    
  end

  # GET /medical_records/1
  # GET /medical_records/1.json
  def show
    authorize! :read, @medical_record
  end

  # GET /medical_records/new
  def new
    @template ||= MedicalRecordTemplate.find(params[:medical_record_template_id])
     if params[:search].blank?
      # @patients = Patient.all
      @patients = Patient.all.paginate(:page => params[:page], :per_page => 5) 
     else
      # @patients = Patient.search(params[:search])
      @patients = Patient.search(params[:search]).paginate(:page =>params[:page], :per_page => 5)
     end
    @medical_record = @template.medical_record.build
    # p @template.question.size
 
    # for @question in @template.question
  
      @medical_record.answer.build()
    #   p @question.qtype
    # end
  end

  # GET /medical_records/1/edit
  def edit
      authorize! :update, @medical_record
   @template ||= MedicalRecordTemplate.find(params[:medical_record_template_id])
   @medical_record ||= MedicalRecord.find(params[:id])
  end
  
  # POST /medical_records
  # POST /medical_records.json
  def create
        @template ||= MedicalRecordTemplate.find(params[:medical_record_template_id])
        @medical_record = @template.medical_record.new(medical_record_params)
        @medical_record.created_at = Time.now
    respond_to do |format|
      if @medical_record.save
        format.html { redirect_to medical_record_template_medical_records_path, notice: 'Medical record was successfully created.' }
        format.json { render :show, status: :created, location: @medical_record }
      else
        format.html { render :new }
        format.json { render json: medical_record_template_medical_records_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medical_records/1
  # PATCH/PUT /medical_records/1.json
  def update
    respond_to do |format|
      if @medical_record.update(medical_record_params)
        format.html { redirect_to medical_record_template_medical_records_path, notice: 'Medical record was successfully updated.' }
        format.json { render :show, status: :ok, location: @medical_record }
      else
        format.html { render :edit }
        format.json { render json: medical_record_template_medical_records_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_records/1
  # DELETE /medical_records/1.json
  def destroy
    @medical_record.destroy
    respond_to do |format|
      format.html { redirect_to medical_record_template_medical_records_path, notice: 'Medical record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_record
      @medical_record = MedicalRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medical_record_params
      params.require(:medical_record).permit(:hospital_id, :answer_id, :id, :_destroy,:patient_id,:answer_attributes => [ :id,:_destroy,:qtype, :short_answer,:sub_question_id,:sub_question_answer, :qid, :choice, :question_id, :question_content, :question, :check_box => []])
    end
end
