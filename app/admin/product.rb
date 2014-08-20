ActiveAdmin.register Product do

  config.per_page = 10

  index do
    column :name
    column :image_url
    column :description
    column :price, :sortable => :price do |product|
      div :class => "price" do
        number_to_currency product.price
      end
    end

    # column :created_at   
    column "Released Date", :updated_at

    actions
  end

  permit_params :name, :image_url, :description, :price

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :image_url
      f.input :description
      f.input :price
    end
    f.actions
  end

  filter :name
  filter :description
  filter :price , :as => :numeric
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
