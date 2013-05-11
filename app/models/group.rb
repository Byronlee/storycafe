class Group
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :user, :type => String
  field :title, :type => String
  field :description, :type => String
  field :todo, :type => String
  has_many :stories

  def self.get_group_by_group_id id
    where(_id: id).first
  end

  def self.get_default_group
    find_by(title: "public")
  end

  def self.get_default_groups
    all
  end

  def self.add_group param
     create!(param)
  end
  
  def self.update_group id,pam
    Group.where(_id: id).find_and_modify({"$set"=> pam},new: true)  
  end
end
