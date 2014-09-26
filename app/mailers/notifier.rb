class Notifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.new_released.subject
  #

  def self.new_released(product)
    @mails = []

    User.all.each { |user| @mails << user.email }

    AdminUser.all.each { |admin| @mails << admin.email }

    @mails.each { |m| construct_mail(product, m).deliver }

    # mail to: "chi.chun_chen844@icloud.com", :subject => 'New commodity released!'
      # mail to: "maydaychaaaa@gmail.com", :subject => 'New commodity released!'
  end

  def construct_mail(product, address)
    @product = product
    mail to: address, subject: "New commodity released!"
  end

end
