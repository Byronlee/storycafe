module StoriesHelper
  def current_story
    p "==============================="
    p session[:current_story]
    session[:current_story]
  end


  def current_storys
     Story.get_stories_by_group_id session[:current_group].id
  end

  def get_story_status number
    %w[new started review finished][number-1]
  end

  def get_story_status_title type
   type=="new" ? "new stories" :
   type=="started" ? "stories is beginning" :
   type=="review" ? "completed wait participant to review" : "finished and closed"

  end

  def get_story_next_status next_status
    next_status==2 ? "stories_started" :
    next_status==3 ? "stories_review" : "stories_finished"

  end

end
