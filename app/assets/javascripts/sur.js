
var now_show = 0;
var now_real = 1;
var clicknum = 0;
// clicknum = 0 네 ; 1 아니요 ; 2 모르게쏘요.
var result = 0;
// result = 1 건성 ; 2 일반 ; 3 지성 ; 4 복합성 ; 5 민감성
var re_type = new Array();

$(document).ready(function () {
    $.nintendo();

    $(document).on('click',"#yes",function (e) {
        e.preventDefault();
        clicknum = 0;
        $.mario();
    });

    $(document).on('click',"#no",function (e) {
        e.preventDefault();
        clicknum = 1;
        $.mario();
    });

    $(document).on('click',"#idk",function (e) {
        e.preventDefault();
        clicknum = 2;
        $.mario();
    });


    $(document).on('click',".btn_small",function (e) {
        e.preventDefault();
        $(this).toggleClass('btn_click');
    });

    $(document).on('click',"#chek",function (e) {
        e.preventDefault();
        var n = $('div').find('.btn_click').length;
        var nn = 0;
        $('div').find('.btn_click').each(function(){
            if(nn < n){
                re_type[nn] = $(this).attr('id');
                nn++;
            }
        });
        now_real = 27;
        $.kirby();
        $.nintendo();
        $.finale();
    });
});
// 어떤 버튼이 눌렸는지에 따라 clicknum을 설정하고, mario 함수를 실행합니다.
// 다중 선택 버튼의 경우 버튼이 클릭되어 선택될 경우 "btn_click" 클래스를 추가합니다.

$.mario = function(){
    switch (now_real){
        case 1:{
            switch (clicknum){
                case 0:{
                    now_real = 6;
                    break;
                }
                case 1:{
                    now_real += 1;
                    break;
                }
                case 2:{
                    now_real = 7;
                    break;
                }
            }
            break;
        }

        case 2:{
            switch (clicknum){
                case 0:{
                    now_real = 6;
                    break;
                }
                case 1:{
                    now_real += 1;
                    break;
                }
                case 2:{
                    now_real = 8;
                    break;
                }
            }
            break;
        }

        case 3:{
            switch (clicknum){
                case 0:{
                    now_real = 8;
                    break;
                }
                case 1:{
                    now_real += 1;
                    break;
                }
                case 2:{
                    now_real = 9;
                    break;
                }
            }
            break;
        }

        case 4:{
            switch (clicknum){
                case 0:{
                    now_real = 7;
                    break;
                }
                case 1:{
                    now_real += 1;
                    break;
                }
                case 2:{
                    now_real = 6;
                    break;
                }
            }
            break;
        }

        case 5:{
            switch (clicknum){
                case 0:{
                    now_real = 10;
                    break;
                }
                case 1:{
                    now_real += 1;
                    break;
                }
                case 2:{
                    now_real = 9;
                    break;
                }
            }
            break;
        }

        case 6:{
            switch (clicknum){
                case 0:{
                    now_real = 11;
                    break;
                }
                case 1:{
                    now_real += 1;
                    break;
                }
                case 2:{
                    now_real = 12;
                    break;
                }
            }
            break;
        }

        case 7:{
            switch (clicknum){
                case 0:{
                    now_real = 12;
                    break;
                }
                case 1:{
                    now_real += 1;
                    break;
                }
                case 2:{
                    now_real = 13;
                    break;
                }
            }
            break;
        }

        case 8:{
            switch (clicknum){
                case 0:{
                    now_real = 13;
                    break;
                }
                case 1:{
                    now_real += 1;
                    break;
                }
                case 2:{
                    now_real = 14;
                    break;
                }
            }
            break;
        }

        case 9:{
            switch (clicknum){
                case 0:{
                    now_real = 14;
                    break;
                }
                case 1:{
                    now_real += 1;
                    break;
                }
                case 2:{
                    now_real = 15;
                    break;
                }
            }
            break;
        }

        case 10:{
            switch (clicknum){
                case 0:{
                    now_real = 15;
                    break;
                }
                case 1:{
                    now_real += 1;
                    break;
                }
                case 2:{
                    now_real = 11;
                    break;
                }
            }
            break;
        }

        case 11:{
            switch (clicknum){
                case 0:{
                    now_real = 16;
                    break;
                }
                case 1:{
                    now_real += 1;
                    break;
                }
                case 2:{
                    now_real = 18;
                    break;
                }
            }
            break;
        }

        case 12:{
            switch (clicknum){
                case 0:{
                    now_real = 17;
                    break;
                }
                case 1:{
                    now_real += 1;
                    break;
                }
                case 2:{
                    now_real = 16;
                    break;
                }
            }
            break;
        }

        case 13:{
            switch (clicknum){
                case 0:{
                    now_real = 18;
                    break;
                }
                case 1:{
                    now_real += 1;
                    break;
                }
                case 2:{
                    now_real = 17;
                    break;
                }
            }
            break;
        }

        case 14:{
            switch (clicknum){
                case 0:{
                    now_real = 19;
                    break;
                }
                case 1:{
                    now_real += 1;
                    break;
                }
                case 2:{
                    now_real = 18;
                    break;
                }
            }
            break;
        }

        case 15:{
            switch (clicknum){
                case 0:{
                    now_real = 20;
                    break;
                }
                case 1:{
                    now_real = 17;
                    break;
                }
                case 2:{
                    now_real = 19;
                    break;
                }
            }
            break;
        }

        case 16:{
            switch (clicknum){
                case 0:{
                    now_real = 21;
                    break;
                }
                case 1:{
                    now_real += 1;
                    break;
                }
                case 2:{
                    now_real = 22;
                    break;
                }
            }
            break;
        }

        case 17:{
            switch (clicknum){
                case 0:{
                    now_real = 22;
                    break;
                }
                case 1:{
                    now_real += 1;
                    break;
                }
                case 2:{
                    now_real = 24;
                    break;
                }
            }
            break;
        }

        case 18:{
            switch (clicknum){
                case 0:{
                    now_real = 23;
                    break;
                }
                case 1:{
                    now_real += 1;
                    break;
                }
                case 2:{
                    now_real = 24;
                    break;
                }
            }
            break;
        }

        case 19:{
            switch (clicknum){
                case 0:{
                    now_real = 24;
                    break;
                }
                case 1:{
                    now_real += 1;
                    break;
                }
            }
            break;
        }

        case 20:{
            switch (clicknum){
                case 0:{
                    now_real = 25;
                    break;
                }
                case 1:{
                    now_real = 11;
                    break;
                }
            }
            break;
        }

        case 21:{
            switch (clicknum){
                case 0:{
                    result = 1;
                    now_real = 26;
                    break;
                }
                case 1:{
                    now_real += 1;
                    break;
                }
                case 2:{
                    result = 2;
                    now_real = 26;
                    break;
                }
            }
            break;
        }

        case 22:{
            switch (clicknum){
                case 0:{
                    result = 2;
                    now_real = 26;
                    break;
                }
                case 1:{
                    now_real += 1;
                    break;
                }
                case 2:{
                    result = 1;
                    now_real = 26;
                    break;
                }
            }
            break;
        }

        case 23:{
            switch (clicknum){
                case 0:{
                    result = 3;
                    now_real = 26;
                    break;
                }
                case 1:{
                    now_real += 1;
                    break;
                }
                case 2:{
                    result = 4;
                    now_real = 26;
                    break;
                }
            }
            break;
        }

        case 24:{
            switch (clicknum){
                case 0:{
                    result = 4;
                    now_real = 26;
                    break;
                }
                case 1:{
                    now_real += 1;
                    break;
                }
                case 2:{
                    result = 3;
                    now_real = 26;
                    break;
                }
            }
            break;
        }

        case 25:{
            switch (clicknum){
                case 0:{
                    result = 5;
                    now_real = 26;
                    break;
                }
                case 2:{
                    result = 4;
                    now_real = 26;
                    break;
                }
            }
            break;
        }
    }
    $.kirby();
    $.nintendo();
}
// mario 함수가 누른 버튼에 따라 다음으로 넘어갈 문제 번호를 정합니다. 이후 kirby와 nintendo 함수를 부릅니다.

$.kirby = function(){
    $('.s_n').empty();
    $('.s_q').empty();
    $('.blank').empty();
}
// 커비가 모든 내용을 흡수했습니다!

$.nintendo = function(){
    switch (now_real){
        case 1:{
            $('.s_q').append("모공이 크지 않다.");
            now_show += 1;
            $.btnappend(1);
            break;
        }
        case 2:{
            $('.s_q').append("모공이 매우 작다.");
            now_show += 1;
            $.btnappend(1);
            break;
        }
        case 3:{
            $('.s_q').append("모공이 매우 크다.");
            now_show += 1;
            $.btnappend(1);
            break;
        }
        case 4:{
            $('.s_q').append("모공 크기가 적당하다.");
            now_show += 1;
            $.btnappend(1);
            break;
        }
        case 5:{
            $('.s_q').append("모공 크기가 부분적으로 다르다.");
            now_show += 1;
            $.btnappend(1);
            break;
        }
        case 6:{
            $('.s_q').append("눈 입 주위에 잔주름이 많다.");
            now_show += 1;
            $.btnappend(1);
            break;
        }
        case 7:{
            $('.s_q').append("겨울철은 당기고 여름철은 유분이 많다.");
            now_show += 1;
            $.btnappend(1);
            break;
        }
        case 8:{
            $('.s_q').append("파뷰거 두껍고 피지 분비가 많다.");
            now_show += 1;
            $.btnappend(1);
            break;
        }
        case 9:{
            $('.s_q').append("윤기가 없고 피부도 칙칙하다.");
            now_show += 1;
            $.btnappend(1);
            break;
        }
        case 10:{
            $('.s_q').append("얼굴이 자주 빨개진다.");
            now_show += 1;
            $.btnappend(1);
            break;
        }
        case 11:{
            $('.s_q').append("피부톤이 밝고 고른편이다.");
            now_show += 1;
            $.btnappend(1);
            break;
        }
        case 12:{
            $('.s_q').append("환절기에 피부트러블이 생긴다.");
            now_show += 1;
            $.btnappend(1);
            break;
        }
        case 13:{
            $('.s_q').append("피부톤이 전체적으로 어둡다.");
            now_show += 1;
            $.btnappend(1);
            break;
        }
        case 14:{
            $('.s_q').append("세안 후 당기고 T존 부위는 유분이 많다.");
            now_show += 1;
            $.btnappend(1);
            break;
        }
        case 15:{
            $('.s_q').append("얼굴이 많이 건조하다.");
            now_show += 1;
            $.btnappend(1);
            break;
        }
        case 16:{
            $('.s_q').append("피부에 윤기가 없다.");
            now_show += 1;
            $.btnappend(1);
            break;
        }
        case 17:{
            $('.s_q').append("나이에 비해 피부가 좋다.");
            now_show += 1;
            $.btnappend(1);
            break;
        }
        case 18:{
            $('.s_q').append("화장이 잘 지워지고 유분이 많다.");
            now_show += 1;
            $.btnappend(1);
            break;
        }
        case 19:{
            $('.s_q').append("T존 부위만 화장이 잘 지워진다.");
            now_show += 1;
            $.btnappend(2);
            break;
        }
        case 20:{
            $('.s_q').append("피곤하면 트러블이 생긴다.");
            now_show += 1;
            $.btnappend(2);
            break;
        }
        case 21:{
            $('.s_q').append("세안 후 얼굴이 전체적으로 당긴다.");
            now_show += 1;
            $.btnappend(1);
            break;
        }
        case 22:{
            $('.s_q').append("화장이 오래간다.");
            now_show += 1;
            $.btnappend(1);
            break;
        }
        case 23:{
            $('.s_q').append("여드름성 트러블이 잘 일어난다.");
            now_show += 1;
            $.btnappend(1);
            break;
        }
        case 24:{
            $('.s_q').append("얼굴이 부분적으로 번들거린다.");
            now_show += 1;
            $.btnappend(1);
            break;
        }
        case 25:{
            $('.s_q').append("화장품이나 비누를 바꾸면 트러블이 생긴다.");
            now_show += 1;
            $.btnappend(3);
            break;
        }
        case 26:{
            $('.s_q').append("분석이 완료되었습니다. <br> 당신의 피부타입을 확인하세요.");
            now_show = "";
            $.btnappend(4);
            break;
        }
        case 27:{
            $('.s_q').append("결과를<br>확인하세요.");
            now_show = "";
            break;
        }
    }


    if(now_show == ""){
      $('.s_n').append("");
    }
    else if(now_show < 10){
        $('.s_n').append("0" + now_show);
    }
    else{
        $('.s_n').append(now_show);
    }
}
// 이 함수는 문제 번호를 정의하고 문제를 표시합니다.

$.btnappend = function(z){
    if(z==1){
        $('.blank').append($('<div id="yes" class="btn">네</div>'));
        $('.blank').append($('<div id="no" class="btn">아니요</div>'));
        $('.blank').append($('<div id="idk" class="btn">모르겠어요</div>'));
    }
    else if(z==2){
        $('.blank').append($('<div id="yes" class="btn">네</div>'));
        $('.blank').append($('<div id="no" class="btn">아니요</div>'));
    }
    else if(z==3){
        $('.blank').append($('<div id="yes" class="btn">네</div>'));
        $('.blank').append($('<div id="idk" class="btn">모르겠어요</div>'));
    }
    else if(z==4){
        // $('.blank').append($('<div id="1" class="btn_small">피지</div>'));
        // $('.blank').append($('<div id="2" class="btn_small">주름</div>'));
        // $('.blank').append($('<div id="3" class="btn_small">주근깨</div>'));
        // $('.blank').append($('<div id="4" class="btn_small">여드름</div>'));
        // $('.blank').append($('<div id="5" class="btn_small">아토피</div>'));
        $('.blank').append($('<br><div id="chek" class="btn">결과전송</div>'));
    }
}
// 이 함수는 버튼을 표시해줍니다. z = 1 네,아니요,모르겠어요 ; 2. 네,아니요 ; 3. 네, 모르겠어요

$.finale = function(){
    var rtnum = re_type.length;
    // var rtshow = "";
    var result_show = "";
    // for(i=0;i<rtnum;i++){
    //     switch(re_type[i]*1){
    //         case 1:{
    //             rtshow += "#피지 "
    //             break;
    //         }
    //         case 2:{
    //             rtshow += "#주름 "
    //             break;
    //         }
    //         case 3:{
    //             rtshow += "#주근깨 "
    //             break;
    //         }
    //         case 4:{
    //             rtshow += "#여드름 "
    //             break;
    //         }
    //         case 5:{
    //             rtshow += "#아토피 "
    //             break;
    //         }
    //     }
    // }

    switch(result){
        case 1:{
            result_show = "건성"
            break;
        }
        case 2:{
            result_show = "일반"
            break;
        }
        case 3:{
            result_show = "지성"
            break;
        }
        case 4:{
            result_show = "복합성"
            break;
        }
        case 5:{
            result_show = "민감성"
            break;
        }
    }
    // $('.blank').append('<div class="btn">'+result_show+'</div> <div class="btn">'+rtshow+'</div>');

    // hidden input 태그 'Skintype'에 피부타입 결과 전달하기
    document.getElementById("skintype").value = result_show;
    // Submit 버튼 나타내기
    $('#survey-btn').attr('type', 'submit');
    // 피부타입 분석 결과 보여주기
    $('.blank').append('<div class="btn">' + result_show + '타입</div>');
}
// 결과를 정리해서 화면에 표출합니다.
// 최초 실행용 함수.
