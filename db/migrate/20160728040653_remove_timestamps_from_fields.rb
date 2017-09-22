class RemoveTimestampsFromFields < ActiveRecord::Migration
  def change
    remove_timestamps :fields
  end
end
