#localeで:jaを指定しないと英語圏の人の名前になってしまう
# Faker::Config.locale = :ja
# config/application.rbで設定していれば不要
# config/locales/ja.yml

Faker::Config.locale = :ja
3.times do |index|
  Company.create(
    name: Faker::Company.name,
    url: "http://www.test#{index}.co.jp/",
    address: Faker::Address.city + "12-23#{index}"
  )
end

100.times do |index|
  Customer.create(
    family_name: Faker::Name.last_name,
    given_name: Faker::Name.first_name,
    email: Faker::Internet.email,
    company_id: rand(3) + 1
  )
end
