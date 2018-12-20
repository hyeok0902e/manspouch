$(function () {
    $('.field_s1').fadeIn(2000);

    $('.sign_email').keyup(function (e) { 
        var email11 = $(this).val();

        console.log(email11);
        $.ajax({url: '/check_email',method: 'POST',
        data: {email : email11},
        success: function(response){
            if(response && response.message=='ERROR'){
                $('.sign_email').css("border-bottom","2px solid #D550A2");
                $('.field_s2').slideUp(500);
                $('.fs1_error').slideDown(500);
            }
            else{
                $('.sign_email').css("border-bottom","2px solid #875AED");
                $('.field_s2').slideDown(500);
                $('.fs1_error').slideUp(500);
            }
        }});
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

    $('.sign_tel').keyup(function (e) { 
        e.preventDefault();

        var tel = $('.sign_tel').val();
        var telnum =  /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
        
        if(telnum.test(tel)){
            $('.sign_tel').css("border-bottom","2px solid #875AED");
        }
        else{
            $('.sign_tel').css("border-bottom","2px solid #D550A2");
        }
    });
    
});