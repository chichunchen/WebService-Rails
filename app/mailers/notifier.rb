class Notifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.new_released.subject
  #
  def new_released(product, users)
    @product = product
    # @users = users

    # users.each do |user|
      mail to: "chi.chun_chen844@icloud.com", :subject => 'New commodity released!'
    # end
  end
end
