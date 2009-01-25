class CreateAgents < Sequel::Migration
  def up
    create_table :agents do
      primary_key :id
      varchar :channel
      varchar :first
      varchar :last
      varchar :exten
      integer :group_id
      timestamp :created_at, :default => "now()"
      timestamp :updated_at, :default => "now()"
    end unless DB.table_exists?(:agents)
  end

  def down
    drop_table :agents if DB.table_exists?(:agents)
  end
end
