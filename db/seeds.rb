# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
include Faker
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
# 10000.times do
#         new_id = Faker::Number.unique.number(8).to_str 
#     Patient.create(
#              name: Faker::Name.name,
#              dob: Faker::Date.birthday(1, 100),
#              job: Faker::Job.field,
#              ethnic: ['Kinh','Mông','Tày','Mường','Thái','Hoa','Khác'].sample,
#              oversea: Faker::Address.country,
#              address: Faker::Address.street_address + Faker::Address.city,
#             workplace: Faker::Company.name, 
#              id: new_id, 
#             gender: [ :male, :female ].sample,
#             phone: '0' + Faker::Number.unique.number(10).to_str,
#             email: new_id + '@emed.com',
#             password: "123456",
#             password_confirmation: "123456"
#         )
# end
5000.times do
    MedicalRecord.create(
             patient_id: Patient.all.sample.id,
             medical_record_template_id: "5af5e79f80a29f0cef1020a8",
             created_at: Faker::Time.backward(3000, :evening),
             answer: [
             Answer.new(
                    _qtype: "multiple_choice",
                    choice: ["Có","Không"].sample,
                    question_content:"Có mắc bệnh mãn tính gì không ? ( hen, copd, loét dạ dầy tá tràng, đái tháo đường, cao huyết áp v…v.)",
                    question_id: "5af5e79f80a29f0cef1020a9",
                    sub_question_answer:"",
                    sub_question_id: "5af5e79f80a29f0cef1020ac"
                 ),
             Answer.new(
                    _qtype: "multiple_choice",
                    choice: ["Có","Không"].sample,
                    question_content:"Có hút thuốc lá, thuốc lào hoặc hít khói bụi, khói nhiên liệu đốt hoặc hóa chất độc hại nhiều năm",
                    question_id: "5af5e79f80a29f0cef1020ad",
                    sub_question_answer:"",
                    sub_question_id: "5af5e79f80a29f0cef1020b0"
                 ),
             Answer.new(
                    _qtype: "multiple_choice",
                    choice: ["Có","Không"].sample,
                    question_content:"Có tiền sử dị ứng: viêm khớp, eczema, chàm, viêm mũi dị ứng, viêm kết mạc mùa xuân, dị ứng thức ăn….",
                    question_id: "5af5e79f80a29f0cef1020b1",
                    sub_question_answer:"",
                    sub_question_id: "5af5e79f80a29f0cef1020b4"
                 ),
       
             Answer.new(
                    _qtype: "short_answer",
                    short_answer: ["Không","Bố","Mẹ"].sample,
                    question_content: "Gia đình có ai bị hen không?",
                    question_id: "5af5e79f80a29f0cef1020b5",
                    
                 ),
             Answer.new(
                    _qtype: "multiple_choice",
                    choice: ["Hen phế quản","Không"].sample,
                    question_content:"Người bệnh có ho, khò khè nghe tiếng rít khi thở và nặng ngực khi tiếp xúc với một số dị nguyên hay khói bụi ô nhiễm, cơn ho tái phát về đêm nhiều lần, gặp ở trẻ em hoặc người trẻ đã từng được chẩn đoán hen phế quản hoặc chẩn đoán lần đầu ( nghĩ đến hen phế quản).",
                    question_id: "5af5e79f80a29f0cef1020b6",
                   
                 ),
             Answer.new(
                    _qtype: "multiple_choice",
                    choice: ["COPD","Không"].sample,
                    question_content:"COPD: Người bệnh thường \u003e 40 tuổi, có tiền sử hút thuốc lá, thuốc lào v…v.có ho khạc đờm mạn tính, khó thở liên tục, nặng dần theo thời gian, khó thở tăng khi gắng sức ( nghĩ đến bệnh COPD",
                    question_id: "5af5e79f80a29f0cef1020b9",
                   
                 ),
             Answer.new(
                    _qtype: "short_answer",
                    short_answer: rand(30...80),
                    question_content: "Mạch",
                    question_id: "5af5e79f80a29f0cef1020bc",
                    
                 ),
             Answer.new(
                    _qtype: "short_answer",
                    short_answer: rand(345...400)/10,
                    question_content: "Nhiệt độ",
                    question_id: "5af5e79f80a29f0cef1020bd",
                    
                 ),
             Answer.new(
                    _qtype: "short_answer",
                    short_answer: rand(80...150),
                    question_content: "Huyết áp",
                    question_id: "5af5e79f80a29f0cef1020be",
                    
                 ),  
             Answer.new(
                    _qtype: "short_answer",
                    short_answer: rand(20...70),
                    question_content: "Nhịp thở",
                    question_id: "5af5e79f80a29f0cef1020bf",
                    
                 ),
             Answer.new(
                    _qtype: "short_answer",
                    short_answer: rand(40...100),
                    question_content: "Cân nặng",
                    question_id: "5af5e79f80a29f0cef1020c0",
                    
                 ),
             Answer.new(
                    _qtype: "short_answer",
                    short_answer: rand(60...200),
                    question_content: "Chiều cao",
                    question_id: "5af5e79f80a29f0cef1020c1",
                    
                 ),    
             Answer.new(
                    _qtype: "multiple_choice",
                    choice: ["Hen phế quản","Không"].sample,
                    question_content:"Nghe phổi: bệnh hen nghe phổi có ran rít, ran ngáy nặng có suy hô hấp",
                    question_id: "5af5e79f80a29f0cef1020c2",
                  
                 ),
             Answer.new(
                    _qtype: "multiple_choice",
                    choice: ["COPD","Không"].sample,
                    question_content:"Khám phổi: bệnh COPD lồng ngực co hình thùng, nghe phổi rì rào phế nang giảm, giai đoạn muộn có thể thấy ran rít, ran ngáy, ran ầm, ran nổ; có thể kèm theo suy tim phải (gan to, tĩnh mạch cổ nổi, phù hai chân)",
                    question_id: "5af5e79f80a29f0cef1020c5",
                  
                 ),
             Answer.new(
                    _qtype: "multiple_choice",
                    choice: ["Hen phế quản","Không"].sample,
                    question_content:"Đo chức năng thông khí: bằng máy đo chức năng hô hấp hoặc lưu lượng đỉnh kế đo chỉ số PEF. FEV1 tăng ≥ 12% hoặc ≥ 200ml sau khi hít thuốc giãn phế quản (nếu nghi ngờ có thể đo lại lần 2, chỉ số gaensler FEV1/FVC \u003e 70% sau dùng thuốc giãn phế quản). Chẩn đoán xác định hen phế quản",
                    question_id: "5af5e79f80a29f0cef1020c8",
                  
                 ),
             Answer.new(
                    _qtype: "multiple_choice",
                    choice: ["PaO2 \u003e 60 mmHg(hen nặng)","PaO2 < 60 mmHg(rất nặng)"].sample,
                    question_content:"Đo PaO2: PaO2 \u003e 60 mmHg là hen ở mức độ nặng, PaO2 bình thường là hen ở mức trung bình, PaO2 \u003c 60 mmHg có thể tím sắp ngừng thở",
                    question_id: "5af5e79f80a29f0cef1020cb",
                  
                 ),    
             Answer.new(
                    _qtype: "multiple_choice",
                    choice: ["FEV1/FVC < 70% (COPD)  ","Không"].sample,
                    question_content:"Đo chức năng thông khí: có rối loạn thông khí tắc nghẽn không hồi phục sau nghiệm pháp giãn phế quản, chỉ số Gaensler FEV1/FVC \u003c 70% (tiêu chuẩn vàng để chẩn đoán COPD).",
                    question_id: "5af5e79f80a29f0cef1020ce",
                  
                 ),   
             Answer.new(
                    _qtype: "multiple_choice",
                    choice: ["Nhẹ","Trung bình","Nặng","Rất nặng"].sample,
                    question_content:"Phân loại mức độ nặng của đợt cấp COPD theo PaO2 mmHg: \r\nPaO2 mmHg: \u003e 60 (nhẹ); 50 - 60 (trung bình); 40 - 50 (nặng); \u003c 40 (rất nặng)",
                    question_id: "5af5e79f80a29f0cef1020d1",
                  
                 ),      
             Answer.new(
                    _qtype: "multiple_choice",
                    choice: ["Nhẹ","Trung bình","Nặng","Rất nặng"].sample,
                    question_content:"Phân loại mức độ nặng nhẹ của đợt cấp COPD theo PaCO2 \r\nPaCO2 mmHg: \u003c 45 (nhẹ); 45 - 54 (trung bình); 55 - 65 (nặng); \u003e 65 (rất nặng)\r\n",
                    question_id: "5af5e79f80a29f0cef1020d6",
                  
                 ),
             Answer.new(
                    _qtype: "multiple_choice",
                    choice: ["Nhẹ","Trung bình","Nặng","Rất nặng"].sample,
                    question_content:"Phân loại mức độ nặng của đợt cấp COPD theo pH máu:\r\npH máu: 7,32 – 7,42 (nhẹ); 7,31 - 7,36 (trung bình); 7,25 – 7,3 (nặng); \u003c 7,25 (rất nặng)",
                    question_id: "5af5e79f80a29f0cef1020db",
                  
                 ),
             Answer.new(
                    _qtype: "multiple_choice",
                    choice: ["Có","Không"].sample,
                    question_content:"X-quang ngực: trong bênh COPD có hình ảnh khí phế thũng, tăng áp lực động mạch phổi",
                    question_id: "5af5e79f80a29f0cef1020e0",
                  
                 ),
              Answer.new(
                    _qtype: "multiple_choice",
                    choice: ["Có","Không"].sample,
                    question_content:"Điện tâm đồ: trong COPD có thể thấy dầy nhĩ phải, dầy thất phải",
                    question_id: "5af5e79f80a29f0cef1020e3",
                  
                 ),    
                ]
        )
    
end