# Run after members_to_yaml and generate_feed_json

require 'fileutils'
require 'json'
require 'uri/http'
require 'net/http'
require 'yaml'

member_json = "_data/members.json"
members_dir = "members"
feed_json = "_data/feed.json"

feed = JSON.parse(File.read(feed_json))

memberjson = []
Dir.glob(members_dir + "/*") do |filename|
    member = YAML.load_file(filename)
    host = URI.parse(member['site_url']).host
    last_updated = member['date_listed']

    if host.end_with?("neocities.org")
        # Query the neocities API for last updated date
        username = host.split(".").first
        response = Net::HTTP.get URI('https://neocities.org/api/info?sitename=' + username)
        date_updated = JSON.parse(response)['info']['last_updated']
        timestamp_updated = Date.parse(date_updated).to_time.to_i

        if last_updated < timestamp_updated
            last_updated = timestamp_updated
        end
    end

    feed_entries = feed.select{ |entry| entry['host'] == host }.sort_by{ |entry| Date.parse(entry['date']) }
    if feed_entries.size > 0
        timestamp_updated = Date.parse(feed_entries.last['date']).to_time.to_i
        
        if last_updated < timestamp_updated
            last_updated = timestamp_updated
        end
    end

    member['last_updated'] = last_updated
    memberjson.push(member)
end

File.open(member_json, "w") do |f|
    f.write(JSON.generate(memberjson))
end