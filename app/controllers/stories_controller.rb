# -*- coding: utf-8 -*-
class StoriesController < ApplicationController

  before_filter :authenticate_user!
  def index
    render "index"
  end

  def create
   #  log = Log.new_message "#{current_user.email} create a story of '#{params[:story][:title]}'"
     #用调用方法的形式不可用
     #publish_message("messages/new",log)
  #   PrivatePub.publish_to("/channels/#{session[:current_project].id}", message: log)

     new_length = Story.get_stories_by_group_id(session[:current_group].id)[:new].length
     story   = session[:current_story] =  Story.add_story(params[:story])
     new_length == 0 ? respond_to_html(:_stories_in_status, {resource: [story],type: "new"})
                               : respond_to_html(:_every_story_in_table, {story: story})
  end

  def edit
    session[:current_story] = Story.get_story_by_story_id(params[:id]) if params[:id] != session[:current_story].id
    respond_to_html(:_description,{:meta => { :type => "story"}})
  end

  # put/:id def update
  def update
    session[:current_story] = Story.set_description(params[:id],params[:description])
    # to_json 不知道何时不加
    render :json => "autosave success!".to_json
  end

   # change status of story
   # params[:status] stand for next status
   def change_status
     next_status = get_next_status(params[:next_status])
     next_length = Story.get_stories_by_group_id(session[:current_group].id)[params[:next_status].to_sym].length
     # log = Log.new_message "#{story.title} be to #{params[:status]} by #{current_user.email}"
     # PrivatePub.publish_to(get_channel_path, message: log)
     story = Story.set_story_status(params[:story_id],params[:next_status],next_status)
     next_length != 0 ? respond_to_html(:_every_story_in_table,{story: story})
                                                      : respond_to_html(:_stories_in_status,{resource: [story],type: params[:next_status]})
   end
