class Ability
  include CanCan::Ability

  def initialize(model)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    # def initialize(model)
  case model
    when Patient
      if model.present?  # additional permissions for logged in users (they can manage their posts)
      can :manage, Patient, _id: model.id 
      can :read, MedicalRecord, patient_id: model.id
      end
    when User
      can :manage, MedicalRecordTemplate, hospital_id: model.hospital.id
      can :manage, Hospital, _id: model.hospital.id
      can :manage, MedicalRecord, medical_record_template: {hospital_id: model.hospital.id}
      can :read, MedicalRecord
    else
      can :read, :all
   
  end
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
