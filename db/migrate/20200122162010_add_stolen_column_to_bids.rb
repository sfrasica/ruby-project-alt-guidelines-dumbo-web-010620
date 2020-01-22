class AddStolenColumnToBids < ActiveRecord::Migration[5.2]
  def change
    add_column :bids, :stolen, :integer
  end
end
