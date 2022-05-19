# Preview all emails at http://localhost:3000/rails/mailers/shipment_mailer
class ShipmentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/shipment_mailer/listing_paid
  def listing_paid
    ShipmentMailer.listing_paid
  end

  # Preview this email at http://localhost:3000/rails/mailers/shipment_mailer/shipment_initiated
  def shipment_initiated
    ShipmentMailer.shipment_initiated
  end

end
