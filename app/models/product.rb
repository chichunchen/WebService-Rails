class Product < ActiveRecord::Base
    belongs_to :user

    validates :name, :description , :presence => true
    validates :price, :numericality => { :greater_than_or_equal_to => 1 }
    validates :name, :uniqueness => true
    # validates_format_of :image_url, :with => %r{\.(gif|jpe?g|png)$}i, :message => "must have an image extension"

    searchable do
    	text :name, :description
    end
end
