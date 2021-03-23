class AddBannerImage < ActiveRecord::Migration[6.1]
  def change
    add_column :banners, :banner_image, :string
  end
end
