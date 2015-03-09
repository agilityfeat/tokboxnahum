class RenameColumn < ActiveRecord::Migration
  def change
  	rename_column :rooms, :string, :session_id
  end
end
