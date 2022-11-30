require 'mastodon' # https://github.com/tootsuite/mastodon-api

message = '#なかよしおねえさんたちメモリアル'
base_dir = '/Volumes/HDD2TB/Dropbox/yamadoc/oekaki/nakayosi-oneesan-tati'
pattern = ["#{base_dir}/*.jpg", "#{base_dir}/*.png"]

path = Dir.glob(pattern).sample

client = Mastodon::REST::Client.new(base_url: 'https://fedibird.com', bearer_token: ENV['MASTODON_TOKEN'])

f = File.new(path)

media = client.upload_media(f)
client.create_status(message, media_ids: [media.id] )

