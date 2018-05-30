ActiveAdmin.register ServiceRequest do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  actions :all, :except => [:show,:edit,:destroy]

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
#

  index do
    column :id
    column :created_at
    column :hospital_id
    column :sp_type
    column :time
    column :status
    column :replied_at
    actions do |service_request|
      if service_request.status == :pending
        item 'Approve', approve_admin_service_request_path(service_request)
        item 'Decline', decline_admin_service_request_path(service_request)
      end
    end

  end
  member_action :approve do

  end
  member_action :decline do
    p '1'
  end

  config.filters = false

  controller do
    def approve
      service_request = ServiceRequest.find(params[:id])
      service_request.status = :approved
      hospital = service_request.hospital
      if (!hospital.service_pack)
        hospital.service_pack = ServicePack.new(hospital_id:'5aaa7e5e80a29f183800001e')
        hospital.save
      end
      hospital.service_pack._sp_type = service_request._sp_type
      if (hospital.service_pack.duedate)
        hospital.service_pack.duedate = hospital.service_pack.duedate + service_request.time.days
      else
        hospital.service_pack.duedate = Time.now + service_request.time.days
      end
      service_request.replied_at = Time.now
      service_request.save
      hospital.service_pack.save
      redirect_to admin_service_requests_path, notice: "Approved!"

    end
    def decline
      service_request = ServiceRequest.find(params[:id])
      service_request.status = :declined
      service_request.replied_at = Time.now
      service_request.save
      redirect_to admin_service_requests_path, notice: "Declined!"
    end
  end



end