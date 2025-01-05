# UofT Weblogging Club Website

## Design Principles

- Should be effectively free to host!
    - Prefer Static hosting vs Dynamic
    - Prefer Github Actions vs a dedicated server
    - Everything should be roughly portable

- Prefer complexity in the build process vs complexity in the output
    - No JS!
    - No third party frontend dependencies! (JS, CSS packs, fonts)
    - Severely limit asset size

- *Aggressively* compatible
    - Should be usable on any reasonable screen size
    - Nintendo 3DS browser support
    - The site can be *optimised* for laptop/desktop, but must be *usable* everywhere

## Development

### To add a member

Create the relevant markdown file in ```_members```. YAML fields ```name``` and ```site_url``` are the only mandatory fields.

### To add an RSS feed

In the markdown file for the relevant member in ```_members```, create a YAML field called ```feed``` and set it to the feed link.

### To add a site button

First, place the button image in ```assets/img/site_buttons/member/```. In the markdown file for the relevant member in ```_members```, create a YAML field called ```button``` and set it to the file name (not the path!).

### To add an announcement

Create a markdown file in ```_posts``` following ```YYYY-MM-DD-title.md```. YAML frontmatter should be similar to all other posts.

### To run a dev copy
1. Install Ruby and Bundle
2. 
```bash
./runlocal.sh
```
This should autoinstall the bundle gems and run all needed scripts to properly render the site.

### To deploy
Deployment is automatic on commit. If any further dependancies/plugins are added (ideally using ```bundle add```) make sure to add it to the Gemfile since they are installed at runtime in the Github Actions pipeline.

### Automatic commits
The Actions pipeline from [rsscombine](https://github.com/uoftwebloggingclub/rsscombine) pushes an updated RSS feed which triggers a site rebuild on every meaningful feed update (aka anything but "last updated"). This is used to generate feed previews on the website and host the full version on neocities under /feed.xml.