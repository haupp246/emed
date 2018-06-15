json.prettify!
@answer = @medical_record.answer
json.medical_record do
    json.id @medical_record.id.to_s
    json.hospital do
        json.hospital_id @medical_record.hospital_id.to_s
        json.name @medical_record.hospital.name 
    end
    json.medical_record_template do
        json.medical_record_template_id @medical_record.medical_record_template_id.to_s
        json.name @medical_record.medical_record_template.name
    end
    json.patient do
        json.patient_id @medical_record.patient_id.to_s
        json.name @medical_record.patient.name
        json.gender @medical_record.patient.gender
        json.date_of_birth @medical_record.patient.dob
        json.address @medical_record.patient.address
        json.workplace @medical_record.patient.workplace
        json.phone @medical_record.patient.phone
        json.oversea @medical_record.patient.oversea
        json.ethnic @medical_record.patient.ethnic
    end
    json.content do
        json.array! @answer do |answer|
            question = @medical_record.medical_record_template.question.find( answer.question_id )

            json.question_content question.content
            json.question_type question.qtype
          
            case question.qtype
                 when :short_answer 
               
                    json.answer answer.short_answer

                 when :multiple_choice 
                    json.answer answer.choice 
                 when :check_box
                    check_box = answer.checkbox
                    json.array! check_box
                 
            end
                if answer.sub_question_id
                    json.sub_question do
                        sub_question = question.sub_question
                        json.sub_question_id sub_question.id.to_s
                        json.sub_question_content  sub_question.content
                        json.answer answer.sub_question_answer
                    end
                end
        end
    end
end