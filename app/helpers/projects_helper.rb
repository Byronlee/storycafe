module ProjectsHelper

  def current_project
    # 第一次登录的时候session[:current_project]不存在,为nil
    # 找到默认的project(暂且第一条)交给session[:current_project]
    session[:current_project] ? session[:current_project] : session[:current_project] = Project.get_default_project
  end


end
