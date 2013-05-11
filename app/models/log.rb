class Log
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :content , type: String
  field :isread ,type: Boolean , default: false
  belongs_to :user

  def self.set_message_isread id,isread=true
    find(id).update_attribute(:isread,isread)
  end

  def self.get_unread_message
    find_by(isread: false)
  end

  def self.new_message msg
    create(content: msg)
  end
end
