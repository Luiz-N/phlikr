class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string        :title
      t.text          :caption
      t.string        :path
      t.belongs_to    :album

    t.timestamps
    end
  end
end
