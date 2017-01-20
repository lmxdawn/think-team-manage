/**
 * Created by admin on 2017/1/20.
 */

layui.use(['form'], function(){

    var form = layui.form();

    //监听提交
    form.on('submit(theForm)', function(data){
        layer.alert(JSON.stringify(data.field), {
            title: '最终的提交信息'
        })
        return false;
    });

})