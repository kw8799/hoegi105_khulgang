# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# user = User.new
# user.email = 'hoegi105@gmail.com'
# user.password = 'hoegi105SPK'
# user.password_confirmation = 'hoegi105SPK'
# user.save!

major = Major.new
major.major_code = "001"
major.major_title = "관광학과"
major.save!

major = Major.new
major.major_code = "002"
major.major_title = "문화관광콘텐츠학과"
major.save!

major = Major.new
major.major_code = "003"
major.major_title = "외식경영학과"
major.save!

major = Major.new
major.major_code = "004"
major.major_title = "조리서비스경영학과"
major.save!

major = Major.new
major.major_code = "005"
major.major_title = "컨벤션경영학과"
major.save!

major = Major.new
major.major_code = "006"
major.major_title = "호텔경영학과"
major.save!