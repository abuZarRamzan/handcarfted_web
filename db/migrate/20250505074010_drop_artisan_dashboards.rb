class DropArtisanDashboards < ActiveRecord::Migration[6.1]
  def change
    drop_table :artisan_dashboards
  end
end
