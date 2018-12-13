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

### To-Do List
1. 사용자 정보에 프로필 사진 추가하기: Carrierwave, S3
2. 매뉴얼, 제품 삭제 시 S3 파일 삭제되게..
3. 매뉴얼과 제품에 썸네일 사진 추가하기: Carrierwave, S3
4. 매뉴얼 댓글 기능(Comments < Content)
5. 제품 리뷰 기능 (Reviews < Product)
6. 관리자 기능: 일반 사용자 계정과 Admin 계정 구분 → rails Gem 사용하기

### 필수 준수 사항
1. 들여쓰기 하기 (특히, HTML & CSS)
-  들여쓰기 기준 => Tab 1회 / 스페이스바 금지


### 로컬로 이미지 저장되게 변경해 두었습니다.(재변경은 아래 링크로 따라가면서 주석 처리해 주시면 됩니다. 링크 참조)
1. https://code.tutsplus.com/tutorials/rails-image-upload-using-carrierwave-in-a-rails-app--cms-25183