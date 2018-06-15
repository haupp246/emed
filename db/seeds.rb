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
start_time = Time.now.to_f
time = Benchmark.measure do
25000.times do
        new_id = Faker::Number.unique.number(8).to_str
    Patient.create(
             name: Faker::Name.name,
             dob: Faker::Date.birthday(1, 100),
             job: Faker::Job.field,
             ethnic: ['Kinh','Mông','Tày','Mường','Thái','Hoa','Kinh','Kinh','Kinh','Kinh','Kinh','Kinh'].sample,
             oversea: Faker::Address.country,
             address: Faker::Address.street_address + Faker::Address.city,
            workplace: Faker::Company.name,
             id: new_id,
            gender: [ :male, :female ].sample,
            phone: '0' + Faker::Number.unique.number(10).to_str,
            email: new_id + '@emed.com',
            password: "123456",
            password_confirmation: "123456"
        )
  end
end
p time
#
# 10000.times do
#     patient = Patient.all.sample
#     MedicalRecord.create(
#              patient_id: patient.id,
#              hospital_id: "5aaa7e5e80a29f183800001e",
#              patient_name: patient.name,
#              medical_record_template_id: "5af5e79f80a29f0cef1020a8",
#              created_at: Faker::Time.backward(3000, :evening),
#              answer: [
#              Answer.new(
#
#                     choice: ["Có","Không"].sample,
#
#                     question_id: "5af5e79f80a29f0cef1020a9",
#                     sub_question_answer:"",
#                     sub_question_id: "5af5e79f80a29f0cef1020ac"
#                  ),
#              Answer.new(
#
#                     choice: ["Có","Không"].sample,
#
#                     question_id: "5af5e79f80a29f0cef1020ad",
#                     sub_question_answer:"",
#                     sub_question_id: "5af5e79f80a29f0cef1020b0"
#                  ),
#              Answer.new(
#
#                     choice: ["Có","Không"].sample,
#
#                     question_id: "5af5e79f80a29f0cef1020b1",
#                     sub_question_answer:"",
#                     sub_question_id: "5af5e79f80a29f0cef1020b4"
#                  ),
#
#              Answer.new(
#
#                     short_answer: ["Không","Bố","Mẹ"].sample,
#
#                     question_id: "5af5e79f80a29f0cef1020b5",
#
#                  ),
#              Answer.new(
#
#                     choice: ["Hen phế quản","Không"].sample,
#
#                     question_id: "5af5e79f80a29f0cef1020b6",
#
#                  ),
#              Answer.new(
#
#                     choice: ["COPD","Không"].sample,
#
#                     question_id: "5af5e79f80a29f0cef1020b9",
#
#                  ),
#              Answer.new(
#
#                     short_answer: rand(30...80),
#
#                     question_id: "5af5e79f80a29f0cef1020bc",
#
#                  ),
#              Answer.new(
#
#                     short_answer: rand(345...400)/10,
#
#                     question_id: "5af5e79f80a29f0cef1020bd",
#
#                  ),
#              Answer.new(
#
#                     short_answer: rand(80...150),
#
#                     question_id: "5af5e79f80a29f0cef1020be",
#
#                  ),
#              Answer.new(
#
#                     short_answer: rand(20...70),
#
#                     question_id: "5af5e79f80a29f0cef1020bf",
#
#                  ),
#              Answer.new(
#
#                     short_answer: rand(40...100),
#
#                     question_id: "5af5e79f80a29f0cef1020c0",
#
#                  ),
#              Answer.new(
#
#                     short_answer: rand(60...200),
#
#                     question_id: "5af5e79f80a29f0cef1020c1",
#
#                  ),
#              Answer.new(
#
#                     choice: ["Hen phế quản","Không"].sample,
#
#                     question_id: "5af5e79f80a29f0cef1020c2",
#
#                  ),
#              Answer.new(
#
#                     choice: ["COPD","Không"].sample,
#
#                     question_id: "5af5e79f80a29f0cef1020c5",
#
#                  ),
#              Answer.new(
#
#                     choice: ["Hen phế quản","Không"].sample,
#
#                     question_id: "5af5e79f80a29f0cef1020c8",
#
#                  ),
#              Answer.new(
#
#                     choice: ["PaO2 \u003e 60 mmHg(hen nặng)","PaO2 < 60 mmHg(rất nặng)"].sample,
#
#                     question_id: "5af5e79f80a29f0cef1020cb",
#
#                  ),
#              Answer.new(
#
#                     choice: ["FEV1/FVC < 70% (COPD)  ","Không"].sample,
#
#                     question_id: "5af5e79f80a29f0cef1020ce",
#
#                  ),
#              Answer.new(
#
#                     choice: ["Nhẹ","Trung bình","Nặng","Rất nặng"].sample,
#
#                     question_id: "5af5e79f80a29f0cef1020d1",
#
#                  ),
#              Answer.new(
#
#                     choice: ["Nhẹ","Trung bình","Nặng","Rất nặng"].sample,
#
#                     question_id: "5af5e79f80a29f0cef1020d6",
#
#                  ),
#              Answer.new(
#
#                     choice: ["Nhẹ","Trung bình","Nặng","Rất nặng"].sample,
#
#                     question_id: "5af5e79f80a29f0cef1020db",
#
#                  ),
#              Answer.new(
#
#                     choice: ["Có","Không"].sample,
#
#                     question_id: "5af5e79f80a29f0cef1020e0",
#
#                  ),
#               Answer.new(
#
#                     choice: ["Có","Không"].sample,
#
#                     question_id: "5af5e79f80a29f0cef1020e3",
#
#                  ),
#                 ]
#         )
#
# end
