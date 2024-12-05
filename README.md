## UofT Weblogging Club Website

### To run a dev copy
Requires Ruby and Bundle
```bash
bundle install
bundle exec jekyll serve --trace
```
For the second line, a quick script ```runlocal.sh``` is there.

### To deploy
Deployment is automatic on commit. If any further dependancies/plugins are added make sure to add it to the Gemfile since they are installed at runtime in the Github Actions pipeline.

### Automatic commits
The Actions pipeline from [rsscombine](https://github.com/uoftwebloggingclub/rsscombine) pushes an updated RSS feed which triggers a site rebuild every hour as of time of writing. This is used to generate feed previews on the website and host the full version on neocities under /feed.xml.