class AddAddressToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :address, :string
  end
end
