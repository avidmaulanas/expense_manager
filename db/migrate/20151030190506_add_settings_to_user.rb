class AddSettingsToUser < ActiveRecord::Migration
  def change
    add_column :users, :settings, :jsonb, null: false, default: '{}' 
    add_index	 :users, :settings, using: :gin
  end
end
