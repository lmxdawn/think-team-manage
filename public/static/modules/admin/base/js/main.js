/**
 *
 * Created by lk on 17/1/7.
 *
 * 基础js
 */


layui.link(sys_config.lmx_static_url + '/modules/admin/base/css/main.css?t='+ sys_config.lmx_version); //基础css

layui.extend({ //设定组件别名
    'sidebarMenu': 'admin/sidebarMenu' //相对于上述base目录的子目录 （如果sidebarMenu.js是在根目录，也可以不用设定别名 ）
});

layui.use(['sidebarMenu'],function () {

    var $lmx_tab = $("#lmx-tab")
        ,tabwidth = 118
        ,$loading = null
        ,$lmx_main = null

    // 手风琴菜单
    var sidebarMenu = layui.sidebarMenu;




    $(function () {


        //手风琴菜单
        sidebarMenu.show($('.sidebar-menu'));

        $loading=$("#loading");
        $lmx_main = $("#lmx-main");



        var headerHeight = $("#lmx-header").height() + 5 //头部高度加上他的底部
            ,tabHeight = $(".lmx-breadcrumbs").height() //tab 高度
        /**
         * 调整页面宽高
         */
        function fixHeight() {
            $lmx_main.height($(window).height() - headerHeight  - tabHeight - 2);
            $("#lmx-left").height($(window).height());
            // 调整tab 宽度
            calcTaskitemsWidth();
        }


        /**
         * 当页面大小变化 调整页面元素宽高
         */
        $(window).resize(function(){
            fixHeight();
        }).resize();

        /**
         * 窗口刷新完成隐藏loading
         */
        $("#lmx-main iframe").load(function(){
            $loading.hide();
        });

        /**
         * 点击导航栏
         */
        $("#lmx-tab").on("click",'li', function () {
            // 打开窗口
            openapp($(this).attr("app-url"), $(this).attr("app-id"), $(this).attr("app-name"));
            return false;
        });

        /**
         * 双击导航栏
         */
        $("#lmx-tab").on("dblclick",'li', function () {
            closeapp($(this));
            return false;

        });

        /**
         * 点击关闭窗口按钮
         */
        $("#lmx-tab").on("click",'a.lmx-tabitem-tabclose', function () {
            closeapp($(this).parent());
            return false;
        });

        /**
         * 点击向右按钮
         */
        $("#task-next").click(function () {
            var marginleft = $lmx_tab.css("margin-left");
            marginleft = marginleft.replace("px", "");
            var width = $("#lmx-tab li").length * tabwidth;
            var content_width = $("#lmx-nav").width();
            var lesswidth = content_width - width;
            marginleft = marginleft - tabwidth <= lesswidth ? lesswidth : marginleft - tabwidth;
            $lmx_tab.stop();
            $lmx_tab.animate({ "margin-left": marginleft + "px" }, 300, 'swing');
        });

        /**
         * 点击向左按钮
         */
        $("#task-pre").click(function () {
            var marginleft = $lmx_tab.css("margin-left");
            marginleft = parseInt(marginleft.replace("px", ""));
            marginleft = marginleft + tabwidth > 0 ? 0 : marginleft + tabwidth;
            // $lmx_tab.css("margin-left", marginleft + "px");
            $lmx_tab.stop();
            $lmx_tab.animate({ "margin-left": marginleft + "px" }, 300, 'swing');
        });


        /**
         * 点击刷新按钮
         */
        $("#refresh_wrapper").click(function(){
            var $current_iframe=$("#lmx-main iframe:visible");
            $loading.show();
            $current_iframe[0].contentWindow.location.reload();
            return false;
        });


        /**
         * 关闭展开
         */
        $("#close").click(function () {
            var $this = $(this);
            if ($this.hasClass('fa-angle-left')){
                //关闭
                $("#lmx-left").animate({'left' : -200 + 'px'}, 300, 'swing')
                $("#lmx-content").animate({'margin-left' : 0 + 'px'}, 300, 'swing')
                $this.removeClass('fa-angle-left').addClass('fa-angle-right').attr('title','展开侧边栏');
            }else if ($this.hasClass('fa-angle-right')){
                // 展开
                $("#lmx-left").animate({'left' : 0 + 'px'}, 300, 'swing')
                $("#lmx-content").animate({'margin-left' : 200 + 'px'}, 300, 'swing')
                $this.removeClass('fa-angle-right').addClass('fa-angle-left').attr('title','关闭侧边栏');
            }
            return false;
        })


        var id = 1;
        $("body").click(function () {

            if (id < 10)
                openapp('/think-team-manage/public/index.php/admin/main/index.html',id,'测试');
            id ++;



        })

    })




    /**
     * 调整tab栏宽度
     */
    function calcTaskitemsWidth() {
        var width = $("#lmx-tab li").length * tabwidth;
        $lmx_tab.width(width);
        if (($(document).width()-268-tabwidth- 30 * 2) < width) {
            $("#lmx-nav").width($(document).width() -268-tabwidth- 30 * 2);
            $("#task-next,#task-pre").show();
        } else {
            $("#task-next,#task-pre").hide();
            $("#lmx-nav").width(width);
        }
    }

    /**
     * 关闭导航栏
     * @param $this 当前导航栏
     */
    function closeapp($this){
        if(!$this.is(".noclose")){
            $this.prev().click();
            $this.remove();
            $("#appiframe-"+$this.attr("app-id")).remove();
            calcTaskitemsWidth();
            $("#task-next").click();
        }

    }

    var task_item_tpl = '<li class="lmx-tabitem">' +
                            '<span class="lmx-tabitem-text" title=""></span>' +
                            '<a class="lmx-tabitem-tabclose" href="javascript:void(0);" title="点击关闭标签">' +
                            '<span></span>' +
                            '<b class="lmx-tabitem-tabclose-icon">×</b>' +
                            '</a>' +
                        '</li>';

    var appiframe_tpl='<iframe style="width: 100%; height: 100%;" frameborder="0" class="appiframe"></iframe>';

    /**
     * 打开网页
     * @param url 地址
     * @param appid 菜单id
     * @param appname 菜单名称
     * @param refresh 是否刷新
     */
    function openapp(url, appid, appname, refresh) {
        // 获取tab按钮
        var $app = $("#lmx-tab li[app-id='"+appid+"']");
        $("#lmx-tab .current").removeClass("current");
        if ($app.length == 0) {
            var task = $(task_item_tpl).attr("app-id", appid).attr("app-url",url).attr("app-name",appname).addClass("current");
            task.find(".lmx-tabitem-text").html(appname).attr("title",appname);
            $lmx_tab.append(task);
            $(".appiframe").hide();
            $loading.show();
            $appiframe=$(appiframe_tpl).attr("src",url).attr("id","appiframe-"+appid);
            $appiframe.appendTo("#lmx-main");
            $appiframe.load(function(){
                $loading.hide();
            });

            calcTaskitemsWidth();
        } else {
            $app.addClass("current");
            $(".appiframe").hide();
            var $iframe=$("#appiframe-"+appid);
            var src=$iframe.get(0).contentWindow.location.href;
            //src=src.substr(src.indexOf("://")+3);
            if(refresh === true){//刷新
                $loading.show();
                $iframe.attr("src",url);
                $iframe.load(function(){
                    $loading.hide();
                });
            }
            $iframe.show();
        }



        var itemoffset= $("#lmx-tab li[app-id='"+appid+"']").index()* tabwidth;
        var width = $("#lmx-tab li").length * tabwidth;

        var content_width = $("#lmx-nav").width();
        var offset=itemoffset+tabwidth-content_width;

        var lesswidth = content_width - width;

        var marginleft = $lmx_tab.css("margin-left");

        marginleft =parseInt( marginleft.replace("px", "") );
        var copymarginleft=marginleft;
        if(offset>0){
            marginleft=marginleft>-offset?-offset:marginleft;
        }else{
            marginleft=itemoffset+marginleft>=0?marginleft:-itemoffset;
        }

        if(-itemoffset==marginleft){
            marginleft = marginleft + tabwidth > 0 ? 0 : marginleft + tabwidth;
        }

        if(content_width-copymarginleft-tabwidth==itemoffset){
            marginleft = marginleft - tabwidth <= lesswidth ? lesswidth : marginleft - tabwidth;
        }

        $lmx_tab.animate({ "margin-left": marginleft + "px" }, 300, 'swing');


    }

})