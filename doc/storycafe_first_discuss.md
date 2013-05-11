##Storycafe 项目第一阶段分析：
#####（一）.注意功能：
1. 加入简单的时间管理
2. 熟悉番茄土豆的插件
3. 加入工作流 项目流程控制
4.  加入TODO



###TODO
   工具的选择：
      前台： bootstrap( less html5 )   
      框架： rails   
      数据库：mongodb   
      测试：rspec   
      代码管理：gitlab  
      
###   先要解决的问题：
      rails new app -GOSJT (git orm[activitiSAciord] assert javascript test)
      搭建 git 环境
      rails 手动配置数据库（对一个已有的项目 更改数据库，能正常运行）
      创建数据库迁移
      rails 手动配置 slim , 手动配置 js,  手动配置 css
      新建 assert 的途径识别
      手动配置测试rspec
      先达测试环境
      
      
###rspec 搭建
      rails new storycafe -GOSJT
      add Gemfile 'rspec and rspec-rails'
      rails g rspec:install
### 搭建mongodb数据库
      add Gemfile 'mongoid'  => bundle
      rails g mongoid:config
      开启数据库
      把spec_helper.rb 里的 #config.fixture_path = "#{::Rails.root}/spec/fixtures"
       和 #  config.use_transactional_fixtures = true 注释掉
### 对sili  js   css 的配置使用
     add Gemfile 'slim,  slim-rails'
      bundle
      rails g controller home index
      
### 搭建迁移文件
     add Gemfile  mongoid,bson_ext,mongoid_rails_migrations'
     bundle install
     rails g mongoid:migration user_migration
     seed.rb 的使用
###  在项目中使用bootstrap （assets 的配置，因为建项目的时候把它关闭了的）
     先把各个文件放到对用的 文件夹下
     在config/application.rb 修改：
     1. 把require "sprockets/railtie" 前的注释去掉
     2. 添加 config.assets.enabled = true
 然后就可以建立对应的测试文件了
   写Storycafe的 user story (  用pragmatic)
      
      
      
  

