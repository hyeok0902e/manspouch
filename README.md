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

### To-Do List
- Likes, Views 추가하기
- Content, Product form.html.erb에서 field 수정하기
- 관리자 권한 설정 추가: 일반 사용자 계정과 Admin 계정 구분 → rails Gem 사용하기
- 태그에 링크 달기(나른한 하루 네이버 블로그 참고)
- Validation 적용하기
- Google Vision 연동하기
- 매뉴얼, 제품 삭제 시 S3 파일 삭제되게..
- 피부 분석 기능 구현


### 필수 준수 사항
1. 들여쓰기 하기 (특히, HTML & CSS)
-  들여쓰기 기준 => Tab 1회 / 스페이스바 금지


### 로컬로 이미지 저장되게 변경해 두었습니다.(재변경은 아래 링크로 따라가면서 주석 처리해 주시면 됩니다. 링크 참조)
1. https://code.tutsplus.com/tutorials/rails-image-upload-using-carrierwave-in-a-rails-app--cms-25183
2. /config/initializers/fog.rb 파일 생성하고 세팅하기 → https://blog.naver.com/kbs4674/221039105137
