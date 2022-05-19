class ShipmentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.shipment_mailer.listing_paid.subject
  #
  def listing_paid
    @greeting = "Hi"
    @listing = params[:listing]
    @user = params[:user]

    mail to: @user.email, subject: "Your Item has been purchased."
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.shipment_mailer.shipment_initiated.subject
  #
  def shipment_initiated
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
