ActiveAdmin.register User do

  config.per_page = 10

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :email, :password, :password_confirmation, :address, :phone, :name
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  index do
    column :email
    column :address
    column :phone
    column :name

    actions
  end

  show do |user|
    attributes_table do
      row :email
      row :name
      row :address
      row :phone
      # row :image do
      #   image_tag url_for(:controller => "/application", :action => "show_image", :model => user.class.name, :id => user.id), class: "img-thumbnail img-responsive", width: "113", height: "113"
      # end
      # row :description
    end
  end

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :address
      f.input :phone
      f.input :name
      # f.input :description
      # f.input :image, :as => :file
    end
    f.actions
  end

  config.filters = false



end
