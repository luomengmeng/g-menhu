# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#province
provinces = ["北京","天津","河北","山西","内蒙古","辽宁","吉林","黑龙江","上海","江苏","浙江","安徽","福建","江西","山东","河南","湖北","湖南","广东","广西","海南","重庆","四川","贵州","云南","西藏","陕西","甘肃","青海","宁夏","新疆","香港","澳门","台湾"]
provinces.each do |p|
  Province.create(name: "#{p}")
end

#user
User.create(nickname: "superman" , name: "luomeng" , status: "1" , account_type: "2" , password: "admin123456")


#class
for i in 1 .. 15
    Category.create(name: "class#{i}")
end

#article
Article.create(title: "test_arcitle" , category_id: "14" , status: 1 , home: true)
