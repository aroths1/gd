class UserMailer < ActionMailer::Base
  default from: "admin@groupsydaisy.com"
  
  def send_invoice(user, order)
    @user = user
    @order = order
    mail(to: @user.email, from: @order.trip.leader.email, subject: "Invoice for your #{@order.trip.date} trip")
  end
end
