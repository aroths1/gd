class AddPaymentInstructionsToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :payment_instructions, :text
  end
end
