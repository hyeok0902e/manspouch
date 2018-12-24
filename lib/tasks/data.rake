category = ['스킨케어', '페이스업', '헤어', '바디']
age = ['10대후반', '20대초반', '20대후반', '30대초반', '30대후반', '40대이상']
keyword = ['#연진 #준혁 #민석 #피부', '#사람 #남성 #구르밍 #oily', '#body #dry #올인원', '#서브라임 #호로록 #남자아아']
link = ['https://www.youtube.com/watch?v=CrCnx-KweY4', 'https://www.youtube.com/watch?v=au0_T0trpww', 'https://www.youtube.com/watch?v=39D8jvH8b5g']
price = [20000, 30000, 31000, 15600, 23000, 22200, 34000, 65300, 20500, 8000, 9000, 8500, 31000, 153000, 2000, 15200]
bool = [true, false]
product = ['올인원 로션 200ml', '남성용 파우더', '수면 팩 크림', '페이스업 립밤', '상상 마스크팩 10개입', '꽃을 든 수분크림 3세트', '헤어 밴드', '헤어 팩']
brand = ['블랙몬스터', '스웨거', '아이오페아', '꽃을 든 남자', 'Natural Public', '지오지아', '드리머스']
phone = ['01022364828', '01022093939', '01029292929', '01090909090', '01099898898']
sex = ['남성', '여성']
userid = [1,2,3,4,5,6]

task :add_users => [:environment] do
  (1..6).each do
    pass = Faker::Internet.password(8)
    User.create({
      :profile => File.open(Rails.root + "sample2/1.jpg"),
      :email => Faker::Internet.email,
      :nickname => Faker::Internet.user_name(5..8),
      :phone => phone.sample,
      :age => age.sample,
      :sex => sex.sample,
      :password => pass,
      :password_confirmation => pass
    })
  end

end

task :add_contents => [:environment] do
  users = User.all
  (1..15).each do
    user = users.sample
    Content.create({
      :user_id => user.id,

      :thumb => File.open(Rails.root + "sample1/1.jpg"),
      :category => category.sample,
      :title => Faker::Lorem.word,
      :subtitle => Faker::Lorem.word,
      :body => Faker::Lorem.paragraph,
      :link => link.sample,
      :keyword => keyword.sample,

      :normal => bool.sample,
      :dry => bool.sample,
      :oily => bool.sample,
      :complex => bool.sample,
      :sensitive => bool.sample,

      :notcare => bool.sample,
      :basecare => bool.sample,
      :hardcare => bool.sample,
      :makeup => bool.sample,
      :idol => bool.sample,
      })
  end
end

task :add_creatures => [:environment] do
  users = User.all
  (1..15).each do
    user = users.sample
    Creature.create({
      :user_id => user.id,

      :thumb => File.open(Rails.root + "sample1/1.jpg"),
      :category => category.sample,
      :title => Faker::Lorem.word,
      :subtitle => Faker::Lorem.word,
      :body => Faker::Lorem.paragraph,
      :link => link.sample,
      :keyword => keyword.sample,

      :normal => bool.sample,
      :dry => bool.sample,
      :oily => bool.sample,
      :complex => bool.sample,
      :sensitive => bool.sample,

      :notcare => bool.sample,
      :basecare => bool.sample,
      :hardcare => bool.sample,
      :makeup => bool.sample,
      :idol => bool.sample,
      })
  end
end

task :add_products => [:environment] do
  users = User.all
  (1..15).each do
    user = users.sample
    Product.create({
      :user_id => user.id,

      :thumb => File.open(Rails.root + "sample1/1.jpg"),
      :category => category.sample,
      :name => product.sample,
      :brand => brand.sample,
      :price => price.sample,
      :body => Faker::Lorem.paragraph,
      :link => link.sample,
      :keyword => keyword.sample,

      :normal => bool.sample,
      :dry => bool.sample,
      :oily => bool.sample,
      :complex => bool.sample,
      :sensitive => bool.sample,

      :notcare => bool.sample,
      :basecare => bool.sample,
      :hardcare => bool.sample,
      :makeup => bool.sample,
      :idol => bool.sample,
      })
  end
end
