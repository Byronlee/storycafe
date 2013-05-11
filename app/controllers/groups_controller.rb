# -*- coding: utf-8 -*-
class GroupsController < ApplicationController
  def index
     render_json Group.add_group(params[:group])
  end

  def edit
    session[:current_group] = Group.get_group_by_group_id(params[:id]) if params[:id] != session[:current_group].id
    render "index"
  end

  def create
     render_json Group.create!(params[:group])
  end

  # put update/:id
  def update
    session[:current_group] =  Group.update_group(params[:id],params[:group])
    render_json "success".to_json
  end
end
