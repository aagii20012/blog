class CreateBanners < ActiveRecord::Migration[6.1]
  def change
    create_table :banners do |t|
      t.string :title
      t.string :link
      t.text :description

      t.timestamps
    end
  end
end
