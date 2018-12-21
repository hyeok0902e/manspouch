$(function () {
    sign_c1 = 0;
    sign_c2 = 0;
    sign_c3 = 0;
    sign_c4 = 0;
    sign_c5 = 0;
    sign_c6 = 0;
    

    $(".signup").keydown(function(e) {
        if (e.keyCode == 13){
            e.preventDefault();
            return false;
        }
    });

    $('.field_s1').fadeIn(2000);

    $('.sign_email').keyup(function (e) { 
        sign_c1 = 0;
        var email11 = $(this).val();
        var signvali =  /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;


        $.ajax({url: '/check_email',method: 'POST',
        data: {email : email11},
        success: function(response){
            if(response && response.message=='ERROR'){
                $('.sign_email').css("border-bottom","2px solid #D550A2");
                $('.field_s2').slideUp(500);
                $('.fs1_error').slideDown(500);
            }
            else if(!signvali.test(email11)){
                $('.sign_email').css("border-bottom","2px solid #D550A2");
                $('.fs12_error').slideDown(500);
            }
            else{
                $('.sign_email').css("border-bottom","2px solid #875AED");
                $('.fs1_error').slideUp(500);
                $('.fs12_error').slideUp(500);
                $('.field_s2').slideDown(500);
                sign_c1 = 1;
            }
        }});

    });

    $('.sign_pwd1').keyup(function (e) { 
        sign_c2 = 0;
        e.preventDefault();

        var pwd1 = $('.sign_pwd1').val();
        if(pwd1.length < 6){
            $('.sign_pwd1').css("border-bottom","2px solid #D550A2");
            $('.sign_next').slideUp(500);
        }
        else{
            $('.sign_pwd1').css("border-bottom","2px solid #875AED");
            $('.field_s3').slideDown(500);
            sign_c2 = 1;
        }

        pwd1 = "";
        
    });

    $('.sign_pwd2').keyup(function (e) { 
        sign_c3 = 0;
        e.preventDefault();

        var pwd1 = $('.sign_pwd1').val();
        var pwd2 = $('.sign_pwd2').val();

        var tf = Boolean(pwd1===pwd2);
        if(tf){
            $('.sign_pwd2').css("border-bottom","2px solid #875AED");
            $('.fs3_error').slideUp(500);
            sign_c3 = 1;
        }
        else{
            $('.sign_pwd2').css("border-bottom","2px solid #D550A2");
            $('.fs3_error').slideDown(500);
        }

        pwd1 = "";
        pwd2 = "";
    });

    $(document).keyup(function(e){
        sign_r1 = sign_c1+sign_c2+sign_c3;
        if(sign_r1 == 3){
            $('.sign_next').slideDown(500);
        }
        else{
            $('.sign_next').slideUp(500);
        }

        sign_r2 = sign_c4+sign_c5+sign_c6
        if(sign_r2 == 3){
            $('.sign_next1').slideDown(500);
        }
        else{
            $('.sign_next1').slideUp(500);
        }
    });

    $(document).click(function(e){

        sign_r2 = sign_c4+sign_c5+sign_c6
        if(sign_r2 == 3){
            $('.sign_next1').slideDown(500);
        }
        else{
            $('.sign_next1').slideUp(500);
        }

    });
    
    $('.sign_next').click(function (e) { 
        e.preventDefault();
        
        $('.signup_1').slideUp(500);    
        $('.field').delay(500).fadeIn(500);    
        $('.signin_text').empty().append("<span>회원 가입</span><br>1단계 - <b>2단계 : 추가 회원정보</b> - 3단계" );
        $('.prettydropdown').css('display','inline-block');
    });
    
    $('.sign_next1').click(function (e) { 
        e.preventDefault();
        
        $('.signup_2').slideUp(500);    
        $('.field1').delay(500).fadeIn(500);    
        $('.actions').delay(500).fadeIn(500);    
        $('.signin_text').empty().append("<span>회원 가입</span><br>1단계 - 2단계 - <b>3단계 : 프로필 등록</b>" );
    });

    $('.sign_nick').keyup(function (e) { 
        sign_c4 = 0;

        var signchk = $('.sign_nick').val();
        var signvali =  /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9]+$/;
        
        if(!signvali.test(signchk)){
            $('.sign_nick').css("border-bottom","2px solid #D550A2");
            $('.fs4_error').slideDown(500);
        }
        else if(signchk.length < 3 || signchk.length > 15){
            $('.sign_nick').css("border-bottom","2px solid #D550A2");
            $('.fs41_error').slideDown(500);
        }
        else{
            $('.sign_nick').css("border-bottom","2px solid #875AED");
            $('.fs41_error').slideUp(500);
            $('.fs4_error').slideUp(500);
            sign_c4 = 1;
        }
    });

    $('.sign_tel').keyup(function (e) { 
        sign_c5 = 0;

        var tel = $('.sign_tel').val();
        var telnum = /^\d{8,15}$/;
        
        if(telnum.test(tel)){
            $('.sign_tel').css("border-bottom","2px solid #875AED");
            $('.fs5_error').slideUp(500);
            sign_c5 = 1;
        }
        else{
            $('.sign_tel').css("border-bottom","2px solid #D550A2");
            $('.fs5_error').slideDown(500);
        }
    });

    $('.sign_select').prettyDropdown({
        width:150
    });

    $('.gender').click(function(){
        sign_c6 = 1;
    });
    

    
});