class TruncateSolidCacheEntries < ActiveRecord::Migration[7.1]
  def change
    truncate :solid_cache_entries
  end
end
