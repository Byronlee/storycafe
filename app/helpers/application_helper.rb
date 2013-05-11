module ApplicationHelper

  def get_channel_path
    "#{Rails.configuration.channel_prefix}/#{current_project.id}"
  end

end
