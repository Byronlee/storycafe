PrivatePub.subscribe(channel_path, function(data, channel) {
  // $(".brand").append(data.message);
//  alert($("#input_1").val())
    //alert(data.message.content)
    _message_list = $("#message_list") 
    _message_list.append("<li>"+data.message.content+"&nbsp;&nbsp;<i class='icon-ok'></i></li>")
         .children(".icon-ok").bind("click",function(event){
           event.stopPropagation(); 
           alert(222)
          //$(this).parent("li").remove()
          })
         .parents(".message_table").bind("click",function(){
           $(this).css("display","block");
          })
            
});

$(document).ready(function(){$("#push_1").bind("click",function(){alert("success");window.notify()})})
window.notify = function (){

//function notify(){
  alert("I want to use notification");
  window.open("http://baidu.com","_blank")
  if(window.webkitNotifications){
    // when it is 0 ,have permission
    if(window.webkitNotifications.checkPermission() > 0){
       alert("I");
       window.webkitNotifications.requestPermission(notify)
       //RequestPermission(notify)
       alert("want");
    } else {
        var notification = window.webkitNotifications.createNotification(
          //"/assets/coffe.jpg",
          "http://images.cnblogs.com/cnblogs_com/flyingzl/268702/r_1.jpg",
          "storycoffe",
          "Hello world"
        );
        notification.onerror = function(){alert(222)}
        notification.show();
      }
     } else {alert('not supported!')}

}
            
   
function init() {
            if (window.webkitNotifications) {
                alert("init")
                window.webkitNotifications.requestPermission();
            }
        }

function RequestPermission (callback) {
  window.webkitNotifications.requestPermission(callback);
}

