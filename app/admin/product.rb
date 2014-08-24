ActiveAdmin.register Product do

  config.per_page = 10

  permit_params :name, :image, :description, :price

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

  show do |product|
    attributes_table do
      row :name
      row :price
      row :image do
        image_tag url_for(:controller => "/application", :action => "show_image", :model => product.class.name, :id => product.id), class: "img-thumbnail img-responsive", width: "113", height: "113"
      end
      row :description
    end
  end


  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :image, :as => :file
      f.input :description
      f.input :price
    end
    f.actions
  end

  filter :name
  filter :description
  filter :price , :as => :numeric



  controller do

    def create
      params[:product][:image] = open(params[:product][:image].tempfile).read if not params[:product][:image].nil?
      super
    end

    def update
      super
    end

    def new
      super
    end

    def show_image
      @product = Product.find(params[:id])
      send_data @product.image, :type => 'image/jpg', :disposition => 'inline'
    end


  end

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
