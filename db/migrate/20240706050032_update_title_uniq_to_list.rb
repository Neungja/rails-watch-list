class UpdateTitleUniqToList < ActiveRecord::Migration[7.1]
  def change
    change_table  :lists do |t|
      t.change :name, :string, null: false
    end
  end
end
