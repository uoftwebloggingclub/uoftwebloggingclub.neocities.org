---
layout: default
---

# Development & Site Documentation

### Source Code & Documentation

The site is built using Jekyll. You can find its source code [on Github](https://github.com/uoftwebloggingclub/uoftwebloggingclub.neocities.org).

Member feeds are aggregated using [`rsscombine`](https://github.com/uoftwebloggingclub/rsscombine), pushed to the website repository thanks to GitHub Actions, and then finally syndicated to other sources (the discord bot, your RSS reader, the website itself) when the website is built. See the following blog posts for the nitty-gritty details:
- [Using Github Actions as janky serverless infrastructure](https://farazkaleemmalik.cyou/blog/2024/githubactions1/).
- [UofT Weblogging and Homebrew Website Club](https://farazkaleemmalik.cyou/projects/webloggingclub/).

### Contributing

If you would like to contribute code, you can take a look at the [existing issues](https://github.com/uoftwebloggingclub/uoftwebloggingclub.neocities.org/issues) on the repository and open a pull request with your changes.

You can also contribute in other ways! If you notice any problems with the website or would like to suggest improvements/features, feel free to [create an issue](https://github.com/uoftwebloggingclub/uoftwebloggingclub.neocities.org/issues/new/choose) on GitHub. If you do not have a GitHub account, you can also email us to report issues or suggest changes (see the [homepage](/) for our email).

### Developer Resources

You can query [`/members.json`](/members.json) for a JSON representation of club members' websites. An example of the JSON representation is below:
```json
{
  "source": "https://uoftwebloggingclub.neocities.org/members.json",
  "timestamp": "1741051438",
  "members":  [
    {
      "feed": "https://farazkaleemmalik.cyou/feed.xml",
      "site_button_url": "https://uoftwebloggingclub.neocities.org/assets/img/site_buttons/member/farazkaleemmalik.png",
      "source_button_url": "https://farazkaleemmalik.cyou/assets/images/button.png",
      "name": "Faraz Kaleem Malik's personal/dev blog",
      "url": "https://farazkaleemmalik.cyou/"
    },
    {
      "feed": null,
      "site_button_url": null,
      "source_button_url": null,
      "name": "msaifi's personal site",
      "url": "https://msaifi.com/"
    }
  ]
}
```

A plain-text list of just the RSS feeds is also available at [`/rss`](/rss). An OPML file containing member feeds is also provided at [`/rss.opml`](/rss.opml).
