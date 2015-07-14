class UserMailer < ActionMailer::Base
  default from: "admin@groupsydaisy.com"
  
  def send_invoice(user, order)
    @user = user
    @order = order
    mail(to: @user.email, from: @order.trip.leader.email, subject: "Invoice for your #{@order.trip.date} trip")
  end
  
  def publicize_trip(addresses, trip, message)
    @addresses = addresses
    @trip = trip
    @message = message
    mail(to: @addresses, from: @trip.leader.email, subject: "Come #{@trip.activity} with #{@trip.group} on #{@trip.date}")
  end
end
