class AddJezebelColumnToWorkOfGifs < ActiveRecord::Migration[5.2]
  def change
    add_column :work_of_gifs, :jezebel, :boolean
  end
end
