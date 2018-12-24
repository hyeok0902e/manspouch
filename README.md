# MASNPOUCH WEB VER 1.0
# START 2018.12.12

### 날짜별 진행 상황
**2018-12-12**
- 데이터베이스 세팅: Gem → mysql2, 세팅 파일 → config/databse.yml
- Scaffold 생성(Model + Controller): Content, Product
- 모델 생성 및 관계 설정: Tag, ContentsTags, ProductsTags
- 컨트롤러 생성: home, mypouch, ranking, mpadmin
- Devise 생성(인증): User
- 에디터 Gem 적용: tinymce-rails, tinymce-rails-langs (at Content, Product)
- tinymce + S3 연동

**2018-12-13**
- 리뷰(Reivew < Product)기능 구현
- 댓글(Comment < Content)기능 구현
- User 정보에 프로필 사진 추가
- Content 와 Product에 썸네일 이미지 추가

**2018-12-14**
- 콘텐츠 좋아요 기능 추가
- 콘텐츠 조회수 기능 추가
- Content, Product, user의 form.html.erb에서 field 수정하기
- 사용자 키워드 선택/저장 기능 구현

**2018-12-16**
- time_ago_in_words, devise error message 한글 패치
- Products Sorting → Ranking
- 카테고리 추가

**2018-12-17**
- creature 추가
- ...

**2018-12-18**
- 뷰 파일 수정 + 표시 데이터 세팅 (메인 메뉴 페이지들)
- ...

**2018-12-19**
- Google Cloud Vision API 연동
- survey js 소스 연동
- mypouch 피부 특성 분석 Process 완성
- mypouch index 페이지 데이터 세팅

**2018-12-21**
- 관리자 권한 설정
- Register Validation
- Google Vision Api 얼굴사진 여부 식별하기

**2018-12-24**
- 맞춤 알고리즘

### To-Do List
- Validation 적용하기
- 소셜 SNS 인증 연동 -> 카카오톡, 페이스북, 네이버 中 택2
- Ajax 통신 시도 해 볼 것 -> 매뉴얼, 제품, 댓글, 리뷰
- Views 마다 노출 버튼 셋팅하기 (권한, 로그인 여부 등에 따른)
- 회원가입 시 프로필사진 보이게..
- 콘텐츠/제품 상세페이지에서 관련 제품/콘텐츠 엮기
- 구글 analystics

### 필수 준수 사항
1. 들여쓰기 하기
-  들여쓰기 기준 => Tab 1회 / 스페이스바 금지

### 로컬로 이미지 저장되게 변경해 두었습니다.(재변경은 아래 링크로 따라가면서 주석 처리해 주시면 됩니다. 링크 참조)
1. https://code.tutsplus.com/tutorials/rails-image-upload-using-carrierwave-in-a-rails-app--cms-25183
2. /config/initializers/fog.rb 파일 생성하고 세팅하기 → https://blog.naver.com/kbs4674/221039105137

### 오류 수정 과정
**정규식**
- 닉네임: http://dyang34.tistory.com/entry/%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8-%ED%95%9C%EA%B8%80-%EC%98%81%EB%AC%B8-%EC%88%AB%EC%9E%90%EB%A7%8C-%EC%9E%85%EB%A0%A5-%EA%B0%80%EB%8A%A5-%EC%A0%95%EA%B7%9C%ED%91%9C%ED%98%84%EC%8B%9D
- 휴대폰 번호: http://dev-jsh.tistory.com/2

**이메일 중복 실시간 체크**
- Ajax 통신 사용: https://stackoverflow.com/questions/38597357/is-there-any-way-to-validate-uniqueness-of-email-on-js-in-a-ruby-on-rails-app

**Google Vision API**
- 나른한 하루(네이버 블로그): https://blog.naver.com/kbs4674/221250727072
- 정규 Docs: https://cloud.google.com/vision/docs/libraries?hl=ko
- 설치해야 할 Gem: rmagick, google-cloud-vision

**Gem rmagick 설치**
- 리눅스: http://dev-jsh.tistory.com/2
- Mac OS: http://morningbird.tistory.com/53

### 참고자료
- Rails 환경변수 설정: http://railsapps.github.io/rails-environment-variables.html
- Social SNS 로그인: https://hcn1519.github.io/articles/2016-12/omniauth_devise_configuration
- 페이스북 api 키 발급 방법: https://m.blog.naver.com/PostView.nhn?blogId=taglive&logNo=220642249212&proxyReferer=https%3A%2F%2Fwww.google.com%2F
