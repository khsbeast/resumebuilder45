class Profile < ApplicationRecord
    has_one_attached :avtaar      #Profile->avtaar relation
    has_many(:educations, dependent: :destroy)   #education->profile relation
    has_many(:projects, dependent: :destroy)     #projects->profile relation
    has_many(:experiences, dependent: :destroy)  #experiences->profile relation
    accepts_nested_attributes_for(:educations , reject_if: :reject_education_create, allow_destroy: true)
    accepts_nested_attributes_for(:experiences , reject_if: :reject_experience_create, allow_destroy: true)
    accepts_nested_attributes_for(:projects , reject_if: :reject_project_create, allow_destroy: true)

    belongs_to :user
    validates :avtaar, presence: true,allow_blank: true, format: {with: %r{\.gif|jpg|png}i} #check image fomrat


    def reject_education_create(education)
        education[:degree].blank? or education[:school].blank? or education[:start].blank? or education[:end].blank?
    end
    def reject_experience_create(experience)
        experience[:company].blank? or experience[:position].blank? or experience[:start].blank? or experience[:end].blank?
    end
    def reject_project_create(project)
        project[:title].blank? or project[:url].blank? or project[:techstack].blank? or project[:description].blank?
    end
end