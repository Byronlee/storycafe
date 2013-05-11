# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init

  def init
     session[:current_group] ||= Group.get_default_group 
     session[:current_story] ||= Story.get_default_story 
  end

  # get next status by current status
  def get_next_status current_status
    Hash[Rails.configuration.status.each_cons(2).to_a][current_status] || current_status
  end

  def current_project
    session[:current_project] ||= Project.get_default_project
  end

  def get_channel_path
    "#{Rails.configuration.channel_prefix}/#{current_project.id}"
  end

  def render_json value
    render :json => value
  end

   def respond_to_html template,locals={},ly=false
     respond_to do |format|
       format.html { render template,locals: locals,:layout => ly}
     end
   end
end
