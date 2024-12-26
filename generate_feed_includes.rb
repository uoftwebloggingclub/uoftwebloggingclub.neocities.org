require 'feed-normalizer'
require 'fileutils'

dir_name = "_recent_feeds"
feed_name = "./feed.xml"

feed_text = File.read(feed_name) # Read and parse feed
feed = FeedNormalizer::FeedNormalizer.parse(feed_text)

FileUtils.rm_rf(dir_name) # This is where the collection lives
Dir.mkdir(dir_name)

# rss-combine doesn't properly sort entries so we have to do that ourselves
feed.entries.sort_by { |item| item.last_updated }.reverse.first(10).each_with_index do |item, i| # Only do the first 10
    File.open(dir_name + "/" + i.to_s + ".html", 'w') do |f|
        f.write("---\ntitle: #{item.title}\nlink: #{item.url}\ndescription: #{item.description}\n---\n#{item.content}")
    end
end