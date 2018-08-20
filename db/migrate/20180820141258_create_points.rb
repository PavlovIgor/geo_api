class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.st_point :lonlat, geographic: true
      t.integer :direction
      t.text :comment

      t.timestamps
    end
  end
end
