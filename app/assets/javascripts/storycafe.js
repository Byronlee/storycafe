jQuery(function(){
    function  StoryCafe(){
        var $this = this;
        var config ={
            navbar: $("div[class~=navbar]"),
            slide_left: $("div[class~=slide-left]"),
            slide_right: $("div[class~=span10]"),
            slide_left_width: $("div[class~=slide-left]").width(),
            slide_right_width:$("div[class~=slide-right]").width(),
            window_height :$(window).height(),
            window_width :$(window).width(),
            block_num:1,
            document_height : $(window).height()-$(".navbar-inverse").height(),
            no_content: '<div class="no_content"><div class="content"><p><i class="icon-pencil">'+
                        'There are no storys with status new in this Iteration  ！</i><i class="icon-edit">'+
                        'Tipc Fill in the blanks and click the new story button in the navigation bar.</i></p></div></div>'
        }
        $this.situations = [
                             [ "#new_story"        ,[  [ "ajax:beforeSend"  , {callback:function(){
                                                                               //    alert("故事不能为空！")
                                                                               }}
                                                        ],
                                                        ["ajax:success", {callback:function(event,data,status, xhr){
                                                                                var $o = $(".block-stories-new");
                                                                                if ($o.find("table").length>0){
                                                                                   $o.find("table").append(data)
                                                                                  var num =$o.find(".nav").find(".span1")
                                                                                   num.html(parseInt(num.text())+1);
                                                                                }else{ $o.html(data)};
                                                                                $this.layout.call(this);
                                                                              }}
                                                        ],
                                                        ["ajax:error"       , { callback:function(){
                                                                                 alert("网络错误，稍后再试！")
                                                                              }}
                                                        ]
                                                     ]
                              ],
                              [ "#new_project"      ,[  [ "ajax:beforeSend"  , {callback:function(){
                                                                                  confirm("确定要添加此项目？")
                                                                               }}
                                                        ],
                                                        ["ajax:success"     , { callback:function(){
                                                                                  alert("create project successlly");
                                                                              }}
                                                        ],
                                                        ["ajax:error"       , { callback:function(){
                                                                                 alert("网络错误，稍后再试！")
                                                                              }}
                                                        ]
                                                     ]
                              ],
                              [ "#description_todo",[  [ "ajax:beforeSend" , {callback:function(){
                                                                                  if(!$(this).children("textarea").val()) return;
                                                                                }}
                                                           ],
                                                           ["ajax:success"    , { callback:function(){
                                                                                }}
                                                           ],
                                                           ["ajax:error"      , { callback:function(){
                                                                                  alert("description自动保存失败，稍后再试！")
                                                                                }}
                                                           ]
                                                        ]
                              ],
                              [ "#new_group"         , [  [ "ajax:beforeSend" , {callback:function(){
                                                                                  }}
                                                          ],
                                                          ["ajax:success"     , { callback:function(data){
                                                                                   $('#myModal').modal('hide');
                                                                                   $("#group_list").append(data);
                                                                                  }}
                                                          ],
                                                          ["ajax:error"       , { callback:function(){
                                                                                  alert("网络错误，稍后再试！")
                                                                                }}
                                                          ]
                                                       ]
                              ],
                              [ "#todo-description-areatext",[  [ "blur"           , {callback:function(){
                                                                                      $(this).parent().submit();
                                                                                }}
                                                           ]
                                                        ]
                              ],
                              [ ".change_status_icon" , [  [ "ajax:beforeSend" , {callback:function(){

                                                                                  }}
                                                          ],
                                                           ["ajax:success"     , { callback:function(event,data,status, xhr){
                                                                                  if  ( $(this).parents("tr").siblings().length>=1){
                                                                                       var this_num = $(this).parents("div[class|=block]").find(".nav").find(".span1");
                                                                                        this_num.html(parseInt(this_num.text())-1);
                                                                                    }
                                                                                    $(this).parents("tr").remove();
                                                                                     var block =  config.slide_right.find("tbody:empty").parents("div[class|=block]")
                                                                                         block.find(".content").append(config.no_content);
                                                                                         block.find(".nav").find(".span1").html(0);
                                                                                         block.find("table").remove();
                                                                                     var    $o=  $(".block-stories-"+$(this).attr("attr_next_status"));
                                                                                     if ($o.find("table").length>0){
                                                                                        $o.find("table").append(data)
                                                                                        var num =$o.find(".nav").find(".span1")
                                                                                        num.html(parseInt(num.text())+1);
                                                                                     }else{ $o.html(data)};
                                                                                    $this.layout.call(this);
                                                                                }}
                                                          ],
                                                          ["ajax:error"       , { callback:function(){
                                                                                  alert("网络错误，稍后再试！")
                                                                                }}
                                                          ]
                                                       ]
                              ],
                              [ "span[class~=icon-arrow-up]" , [  [ "click"    , {callback:function(){
                                                                                    $this.animats.nav_animat.call(this);
                                                                                  }}
                                                          ]
                                                       ]
                              ],
                              [ "span[class~=icon-arrow-left]" , [  [ "click"    , {callback:function(){
                                                                                    $this.animats.layout_animat.animate.call(this);
                                                                                  }}
                                                          ]
                                                       ]
                              ],
                              [ ".every-story"         , [  [ "ajax:beforeSend" , {callback:function(){
                                                                                  }}
                                                            ],
                                                            ["ajax:success"     , { callback:function(event,data,status, xhr){
                                                                                    $("div[class=block-story-description]").html(data)
                                                                                  }}
                                                            ],
                                                            ["ajax:error"       , { callback:function(){
                                                                                  alert("story网络错误，稍后再试！")
                                                                                }}
                                                            ]
                                                         ]
                              ],
                              [ "#explorer"                    , [  [ "click"    , {callback:function(){

                                                                                      $("div[class=preimage]").slideToggle(1000,function(){
                                                                                         $(this).css("display")=="none" ? $("#explorer").children("img").attr("src", "/assets/down.png") :
                                                                                                                          $("#explorer").children("img").attr("src","/assets/up.png")
                                                                                      })

                                                                                       $("div[class~=no_login_content]").slideToggle(1000);
                                                                                  }}
                                                          ]
                                                       ]
                              ]
                            ]  ;
      $this.init_event= function(){
            for( var i =0 ;i<$this.situations.length ;i++){
                for(var j =0 ;j<$this.situations[i][1].length ;j++){
                    $($this.situations[i][0]).live($this.situations[i][1][j][0] ,$this.situations[i][1][j][1].callback) ;
                }

            }
        }



        $this.layout=function(){
            config.slide_right.find("div[class|=block]").css("width", config.slide_right_width/3).css("height", config.document_height/2).find("textarea").css("height",(config.document_height/2)*0.7 )
                .end().find("td[class=span8] a").css("max-width",(config.slide_right_width/3)*0.61)
        }

       $this.init_layout= function(){
          config.slide_left.children("div[class|=side]").css("height", config.document_height/2);
          $this.layout.call(this);

          // without user login
          $("div[class=preimage]").children("img").css("height" ,config.document_height-0.1);
          $("div[class~=no_login_content]").css("display","none");

          setInterval(function(){
              if(config.window_width!=$(window).width()||config.window_height!=$(window).height()||config.document_height!= ($(window).height()-$(".navbar-inverse").height())){
                  config.window_width=$(window).width();
                  config.window_height=$(window).height()
                  config.slide_right_width =$("div[class~=slide-right]").width();
                  config.slide_left_width= $("div[class~=slide-left]").width();
                  config.document_height = config.window_height-$(".navbar-inverse").height();

                  config.slide_left.children("div[class|=side]").css("height", config.document_height/2);
                  $this.layout();


              }
          },true);
      }
      $this.animats={
          nav_animat:function(){
                 if( config.navbar.css("display")=="block"){
                     config.navbar.animate({opacity: "hide" ,height: 0}, {duration: 800});
                     $("body").prepend("<div class='animat-nav'>"+$('div[class=btn-group-vertical]').html()+"</div>");
                 }else{
                     config.navbar.animate({opacity: "show" ,height :43}, {duration: 800});
                     $("div[class=animat-nav]").remove()
                 }
          },
          layout_animat:{

             animateL :function(){
                 config.slide_left.animate({ "width":arguments[0]}, {duration: 800});
                 return $this.animats.layout_animat ;
             },
              animateR : function(right_width){
                          config.slide_right.animate({ width : right_width},{duration: 800}).queue("fader", function(next) {
                            config.slide_right.find("div[class|=block]").animate({ width: right_width/3},{duration: 800, queue: false});
                            next();
                          })
                          .dequeue("fader");
                  return $this.animats.layout_animat ;
             },
             animate_nav_color: function(color){
                       $(".nav").queue("color", function(next) {
                           $("div[class^=block] .nav").animate({"background":color},{duration: 800, queue: false});
                           next();
                        })
                     .dequeue("color");
                  return $this.animats.layout_animat ;
             },
             animate_function:function(){
                 $this.animats.layout_animat.animateL(arguments[0]).animateR(arguments[1]).animate_nav_color(arguments[2]);
             },
             animate :function(){
                  if( config.slide_left.width()){
                      $this.animats.layout_animat.animate_function.call(this, 0, $(window).width() ,"#666");
                  }else{
                      $this.animats.layout_animat.animate_function.call(this, config.slide_left_width, config.slide_right_width ,"#333");
                 }
              }
          }
      }




    }


    var storycafe = new StoryCafe();
    storycafe.init_event();
    storycafe.init_layout();
});
