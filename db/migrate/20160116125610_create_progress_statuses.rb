class CreateProgressStatuses < ActiveRecord::Migration
  def change
    create_table :progress_statuses do |t|
      t.decimal :percent

      t.timestamps null: false
    end
  end
end
