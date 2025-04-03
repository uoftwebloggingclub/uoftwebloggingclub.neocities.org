require 'feed-normalizer'
require 'fileutils'
require 'json'
require 'uri/http'

data_dir_name = "_data"
feed_name = "./feed.xml"

feed_text = File.read(feed_name) # Read and parse feed
feed = FeedNormalizer::FeedNormalizer.parse(feed_text)

# rss-combine doesn't properly sort entries so we have to do that ourselves
feedjson = []
feed.entries.sort_by { |item| item.last_updated }.reverse.each_with_index do |item, i|
    metadata = {}
    metadata['title'] = item.title
    metadata['link'] = item.url
    metadata['description'] = item.description
    metadata['date'] = item.last_updated.to_i
    metadata['host'] = URI.parse(item.url).host
    metadata['content'] = item.content

    feedjson.push(metadata)
end

File.open(data_dir_name + "/feed.json", "w") do |f|
    f.write(JSON.generate(feedjson))
end