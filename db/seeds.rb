# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
adam = User.create(first_name: 'Adam', last_name: 'Rothschild', email: 'thirdtriplet@gmail.com', password: 'snowMAN1', mobile_phone: '3123513002')
bryan = User.create(first_name: 'Bryan', last_name: 'Shuman', email: 'bhshuman68@gmail.com', password: 'BryanShuman1', mobile_phone: '3032649733')
joel = User.create(first_name: 'Joel', last_name: 'Jones', email: 'joeljones@doctrelo.com', password: 'JoelJones1', mobile_phone: '5555555555')
yc = Destination.create(name: 'Youghiogheny Canoe Outfitters')
canoe = Activity.create(name: 'canoeing')
yough_canoeing = DestinationSpecificActivity.create(activity: canoe, destination: yc, start_date: Date.new(2015,5,1), end_date:
 Date.new(2015,9,30))
stc = Group.create(name: 'Shaare Torah Congregation', contact: adam)
aug_30 = Trip.create(group: stc, destination_specific_activity: yough_canoeing, date: Date.new(2015,8,30),
 leader: adam)
canoe_item = Item.create(name: 'canoe', destination_specific_activity: yough_canoeing, price: 47)
double_kayak_item = Item.create(name: 'double kayak', destination_specific_activity: yough_canoeing, price: 47)
single_kayak_item = Item.create(name: 'single kayak', destination_specific_activity: yough_canoeing, price: 27)
