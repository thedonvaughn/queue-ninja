class CreateGroups < Sequel::Migration
  def up
    create_table :groups do
      primary_key :id
      varchar :name
      varchar :description
      timestamp :created_at, :default => "now()"
      timestamp :updated_at, :default => "now()"
    end unless DB.table_exists?(:annotations)
  end

  def down
    drop_table :groups if DB.table_exists?(:annotaions)
  end
end
