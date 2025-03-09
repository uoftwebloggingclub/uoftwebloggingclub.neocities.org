require 'feed-normalizer'
require 'fileutils'
require 'yaml'
require 'uri/http'

dir_name = "_recent_feeds"
feed_name = "./feed.xml"

feed_text = File.read(feed_name) # Read and parse feed
feed = FeedNormalizer::FeedNormalizer.parse(feed_text)

FileUtils.rm_rf(dir_name) # This is where the collection lives
Dir.mkdir(dir_name)

# rss-combine doesn't properly sort entries so we have to do that ourselves
feed.entries.sort_by { |item| item.last_updated }.reverse.each_with_index do |item, i|
    File.open(dir_name + "/" + i.to_s + ".html", 'w') do |f|
        metadata = {}
        metadata['title'] = item.title
        metadata['link'] = item.url
        metadata['description'] = item.description
        metadata['date'] = item.last_updated
        metadata['host'] = URI.parse(item.url).host

        f.write("#{metadata.to_yaml}---\n#{item.content}")
    end
end