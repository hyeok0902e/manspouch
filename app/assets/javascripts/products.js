$(function () {
    $('.left').click('on',function(){
        $('.pd_trend').css("left","1200px");
        console.log("dfdf");
    })
    $(document).on('click',".left",function(){
        $('.pd_trend').css("left","1200px");
        console.log("dfdf");
    });
    $(document).on('click',".right",function(){
        $('.pd_trend').css("right","1200px");
    });
});