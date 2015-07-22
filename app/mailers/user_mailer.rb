class UserMailer < ActionMailer::Base
  default from: "admin@groupsydaisy.com"
  
  def send_invoice(user, order)
    @user = user
    @order = order
    mail(to: @user.email, from: @order.trip.leader.email, subject: "Invoice for your #{@order.trip.date} trip")
  end
  
  def send_publicize_trip(addresses, trip, message)
    @trip = trip
    @message = message
    addresses.each { |a| UserMailer.publicize_trip(a, @trip, @message).deliver}
  end
  
  def send_email_participants(trip, addresses, subject, message)
    @trip = trip
    addresses.each{|a| UserMailer.email_participant(@trip, a, subject, message).deliver}
  end
  
  def email_participant(trip, address, subject, message)
    @trip = trip
    @message = message
    mail(to: address, from: trip.leader.email, subject: subject)
  end
  
  def publicize_trip(address, trip, message)
    @address = address
    #Add code here to save trip-associated email addresses if desired.
    @trip = trip
    @message = message
    mail(to: @address, from: @trip.leader.email, subject: "Come #{@trip.activity} with #{@trip.group} on #{@trip.date}")
  end
end
