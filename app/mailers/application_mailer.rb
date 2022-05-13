class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"

  after_action do
    self.delivery_method = SETTING_FROM_DB.delivery_method
    settings = {
      address: SETTING_FROM_DB.address,
      port: SETTING_FROM_DB.port
      # More setting if needed
      }
    self.mail.delivery_method.settings.merge! settings
   end
end
