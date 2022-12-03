class ChangeShortUrlToShortCodeOnUrls < ActiveRecord::Migration[7.0]
  def change
    remove_column :urls, :short_url, :string
    add_column :urls, :short_code, :string
  end
end
