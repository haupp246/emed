class MedicalRecordTemplatesController < ApplicationController
  load_and_authorize_resource
  before_action :set_medical_record_template, only: [:show, :edit, :update, :destroy]
 
  
  # GET /medical_record_templates
  # GET /medical_record_templates.json
  def index
    
    @medical_record_templates = current_user.hospital.medical_record_template.all
  end

  # GET /medical_record_templates/1
  # GET /medical_record_templates/1.json
  def show
   
  end

  # GET /medical_record_templates/new
  def new
    
    @medical_record_template = current_user.hospital.medical_record_template.new

  end

  # GET /medical_record_templates/1/edit
  def edit
  end

  # POST /medical_record_templates
  # POST /medical_record_templates.json
  def create
    
    @medical_record_template = current_user.hospital.medical_record_template.new(medical_record_template_params)
   
    respond_to do |format|
      if @medical_record_template.save
       
        
        format.html { redirect_to @medical_record_template, notice: 'Medical record template was successfully created.' }
        format.json { render :show, status: :created, location: @medical_record_template }
        
      else
        format.html { render :new }
        format.json { render json: @medical_record_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medical_record_templates/1
  # PATCH/PUT /medical_record_templates/1.json
  def update
  
    respond_to do |format|
      if @medical_record_template.update(medical_record_template_params)
        format.html { redirect_to @medical_record_template, notice: 'Medical record template was successfully updated.' }
        format.json { render :show, status: :ok, location: @medical_record_template }
      else
        format.html { render :edit }
        format.json { render json: @medical_record_template.errors, status: :unprocessable_entity }
      end
    end
  end
  
  

  # DELETE /medical_record_templates/1
  # DELETE /medical_record_templates/1.json
  def destroy
    @medical_record_template.destroy
    respond_to do |format|
      format.html { redirect_to medical_record_templates_url, notice: 'Medical record template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_record_template
      @medical_record_template = MedicalRecordTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medical_record_template_params
      params.require(:medical_record_template).permit(:name, :code, :department, :question_attributes => [:qtype,:atype, :content, :qid,:_destroy,:id,:sub_question_attributes => [:id,:_destroy,:content,:atype,:qtype], :multiple_choice_question_answer_attributes => [:id,:_destroy,:multiple_choice_question_answer_type, :content, :aid]])
    end
    
    
end
