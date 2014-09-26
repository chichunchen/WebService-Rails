class Product < ActiveRecord::Base
  belongs_to :user

  after_create :send_email

  validates :name, :description, :presence => true
  validates :price, :numericality => { :greater_than_or_equal_to => 1 }
# validates_format_of :image_url, :with => %r{\.(gif|jpe?g|png)$}i, :message => "must have an image extension"

  attr_accessor :url


  def send_email
    # Notifier.new_released(self).deliver
    Notifier.new_released(self)
  end

end
