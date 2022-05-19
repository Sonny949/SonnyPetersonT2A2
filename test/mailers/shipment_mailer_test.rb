require "test_helper"

class ShipmentMailerTest < ActionMailer::TestCase
  test "listing_paid" do
    mail = ShipmentMailer.listing_paid
    assert_equal "Listing paid", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "shipment_initiated" do
    mail = ShipmentMailer.shipment_initiated
    assert_equal "Shipment initiated", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
