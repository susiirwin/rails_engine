class CreateItems < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'citext'

    create_table :items do |t|
      t.citext :name
      t.citext :description

      t.timestamps
    end
  end
end
