ActiveAdmin.register Hospital do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
    actions :all, :except => [:show]

    permit_params :id, :name, :code, :address, :phone, :fax, :website, :email
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
        column :code
        column :name
        column :address
        actions
    end
    action_item :approve, method: :put, only: :edit do

    end
    member_action :lock, method: :put do
        resource.lock!
        redirect_to resource_path, notice: "Locked!"
    end
    config.filters = false

    controller do


    end



end
