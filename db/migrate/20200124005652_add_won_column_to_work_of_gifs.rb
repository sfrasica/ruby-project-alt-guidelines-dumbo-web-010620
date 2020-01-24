class AddWonColumnToWorkOfGifs < ActiveRecord::Migration[5.2]
  def change
    add_column :work_of_gifs, :won, :boolean
  end
end
