require 'mastodon'
require 'csv'

image_dir = ENV['IMAGE_DIR']

metadata = CSV.read("#{image_dir}/data/4koma.tsv", col_sep: "\t", headers: true);
manga = metadata[rand(0..metadata.length)]

file_path = "#{image_dir}/#{manga["file_name"]}"
f = File.new(file_path)

message = "#なかよしおねえさんたちメモリアル\nその#{manga["num"]}\n\n#{manga["caption"]}"

url = "https://#{ENV['MASTODON_DOMAIN']}"
token = ENV['MASTODON_TOKEN']

client = Mastodon::REST::Client.new(base_url: url, bearer_token: token)

media = client.upload_media(f)
client.create_status(message, media_ids: [media.id] )
