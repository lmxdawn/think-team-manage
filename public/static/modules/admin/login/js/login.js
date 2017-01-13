

// 登录模块 css
layui.link(sys_config.lmx_static_url + '/modules/admin/login/css/login.css?t='+ sys_config.lmx_version);

layui.use([],function () {


    document.onkeydown=function(event){
        var e = event || window.event || arguments.callee.caller.arguments[0];
        if(e && e.keyCode==13){ // enter 键
            $('#login_btn').click();
        }
    };
    var lock = false;
    $(function () {

        $('#switch_qlogin').click(function(){
            $('#switch_login').removeClass("switch_btn_focus").addClass('switch_btn');
            $('#switch_qlogin').removeClass("switch_btn").addClass('switch_btn_focus');
            $('#switch_bottom').animate({left:'0px',width:'70px'});
            $('#qlogin').css('display','none');
            $('#web_qr_login').css('display','block');

        });
        $('#switch_login').click(function(){

            $('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
            $('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
            $('#switch_bottom').animate({left:'154px',width:'70px'});

            $('#qlogin').css('display','block');
            $('#web_qr_login').css('display','none');
        });


        $('#login_btn').click(function(){
            if(lock){
                return;
            }
            lock = true;
            var $login_err_msg = $("#login_err_msg");
            $login_err_msg.hide();
            var username = $('#username').val();
            var password = $('#password').val();
            var code = $('#code').val();
            if (username == ''){
                $login_err_msg.show().html("<span style='color:red'>请输入用户名</span>");
                return false;
            }
            if (password == ''){
                $login_err_msg.show().html("<span style='color:red'>请输入密码</span>");
                return false;
            }
            if (code == ''){
                $login_err_msg.show().html("<span style='color:red'>请输入验证码</span>");
                return false;
            }

            $('#login_btn').removeClass('btn-success').addClass('btn-danger').val('登陆中...');
            var url = $("#loginForm").attr('action');
            $.post(url,{'username':username, 'password':password, 'code':code},function(data){
                lock = false;
                $('#login_btn').val('登录').removeClass('btn-danger').addClass('btn-success');
                if(data.code!=1){
                    $login_err_msg.show().html("<span style='color:red'>"+data.msg+"</span>");
                    return false;
                }else{
                    window.location.href=data.data;
                }
            });
            return false;

        });
    });



})
