class Project
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :name , type: String
  belongs_to :user

  def self.new_project current_user,param
    current_user.projects.create(param)
  end

  def self.get_default_project
    first
  end
end
