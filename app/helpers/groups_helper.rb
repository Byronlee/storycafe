module GroupsHelper
  def current_group
    session[:current_group] || session[:current_group] = Group.get_default_group 
  end

 def current_groups
   Group.get_default_groups
 end

end

