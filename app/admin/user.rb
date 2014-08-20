ActiveAdmin.register User do

  config.per_page = 10

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :email, :password, :password_confirmation, :address, :phone
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

    actions
  end

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :address
      f.input :phone
    end
    f.actions
  end

  config.filters = false

end
