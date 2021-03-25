ActiveAdmin.register Banner do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :title, :link, :description, :banner_image
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :link, :description, :banner_image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form title: 'A custom title' do |f|
    inputs 'Details' do
      input :title
      input :link
      input :description
      input :banner_image, :as => :file
    end
    f.actions
  end
  show do
    div do
      simple_format banner.description
    end
    div do
      image_tag(banner.banner_image,class:"image")
    end
  end
  
end
