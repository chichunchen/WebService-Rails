class Notifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.new_released.subject
  #

  def new_released(product)
    @product = product

    # send to all users
    @users = User.all

    @users.each { |user| mail to: user.email, :subject => 'New commodity released!' }
    # mail to: "chi.chun_chen844@icloud.com", :subject => 'New commodity released!'
      # mail to: "maydaychaaaa@gmail.com", :subject => 'New commodity released!'
  end
end
