$(function () {
    $('.field_s1').fadeIn(2000);
    $('.field_s1').keyup(function (e) { 
        e.preventDefault();
        $('.field_s2').delay(700).slideDown(500);
    });

    $('.sign_pwd1').keyup(function (e) { 
        e.preventDefault();

        var pwd1 = $('.sign_pwd1').val();
        if(pwd1.length < 6){
            $('.sign_pwd1').css("border-bottom","2px solid #D550A2");
        }
        else{
            $('.sign_pwd1').css("border-bottom","2px solid #875AED");
            $('.field_s3').slideDown(500);
        }

        pwd1 = "";
        
    });

    $('.sign_pwd2').keyup(function (e) { 
        e.preventDefault();

        var pwd1 = $('.sign_pwd1').val();
        var pwd2 = $('.sign_pwd2').val();

        var tf = Boolean(pwd1===pwd2);
        if(tf){
            $('.sign_pwd2').css("border-bottom","2px solid #875AED");
            $('.sign_next').slideDown(500);
        }
        else{
            $('.sign_pwd2').css("border-bottom","2px solid #D550A2");
        }

        pwd1 = "";
        pwd2 = "";
    });

    $('.sign_next').click(function (e) { 
        e.preventDefault();
        
        $('.signup_1').slideUp(500);    
        $('.field').delay(500).fadeIn(500);    
    });
    
});