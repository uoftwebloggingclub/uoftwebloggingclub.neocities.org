---
layout: post
title: RSS Cheatsheet
date: December 27 2024
---

Some services, while they don't advertise RSS feeds anywhere on the website, still have them if you look hard enough!

### Wix

```https://<domain>/blog-feed.xml```

[Example](https://www.wix.com/blog/blog-feed.xml)

### Medium

```https://medium.com/feed/<username>```

[Example](https://medium.com/feed/wix-engineering)

### YouTube

```https://www.youtube.com/feeds/videos.xml?channel_id=<channel id>```

The channel id is usually hidden from the user, and can be found using websites like [this](https://ytlarge.com/youtube/channel-id-finder/)

[Example](https://www.youtube.com/feeds/videos.xml?channel_id=UCX6OQ3DkcsbYNE6H8uQQuVA)

### Tapas

Apparently this is really complicated, and the only thing I can find is a [greasyfork](https://greasyfork.org/en/scripts/405379-tapas-io-rss-button/code) script that does the job. You will need it install either the TamperMonkey or ViolentMonkey browser extensions to install this, and be sure to enable [developer mode](https://www.tampermonkey.net/faq.php#Q209).

[Example](https://tapas.io/rss/series/281869)

### Neocities

Assuming the website doesn't publish its own feed, you can make do with a much less detailed feed like so

```https://neocities.org/site/<username>.rss```

Since neocities can't really determine anything detailed from the updates, it will give you a generic title like "\<username\>'s website has been updated" which is why a self-published feed is preferable.

[Example](https://neocities.org/site/uoftwebloggingclub.rss)