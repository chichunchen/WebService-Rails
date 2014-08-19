class Product < ActiveRecord::Base
    belongs_to :user

    validates :name, :description , :presence => true
    validates :price, :numericality => { :greater_than_or_equal_to => 1 }
    validates :name, :uniqueness => true
end
