# -*- coding: utf-8 -*-
class Story
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :user, type: String
  field :title, type: String
  field :description, type: String
  belongs_to :group
  belongs_to :user
  auto_increment :list_id,:seed => 0, :collection => "story_list_ids"
  field :current_status, type: String , default: "new"
  field :next_status, type: String , default: "started"

  def self.add_story params_story
    create!(params_story)
  end

  def self.get_stories_by_group_id id
   Rails.configuration.status.inject({}) do |result,s|
     result.merge(Hash[s.to_sym,get_stories_by_groupid_and_currentstatus(id,s)])
   end
  end

  # get default stories of public group
  def self.get_default_stories
    Group.get_default_group.stories
  end

  def self.get_default_story
    Group.get_default_group.stories.first
  end

  def self.get_story_by_story_id id
    find(id)
  end

  # id : story_id
  # status : current_status
  def self.set_story_status id,current_status,next_status
    where(_id: id).find_and_modify({"$set" => { current_status: current_status,
                                                 next_status: next_status
                                              }},new: true)
  end

  def self.get_stories_by_groupid_and_currentstatus id,status
    where(group_id: id,current_status: status)
  end

  def self.set_description id,des
    Story.where(_id: id).find_and_modify({"$set"=> {description: des}},new: true)  
  end
end
