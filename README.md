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
    - The site can be *optimised* for laptop/desktop, but must be *usable*
      everywhere

## Development

### To add a member

1. Fork + locally clone the repository.
2. Copy the example file located at ```_members/example.md``` and rename it to
   ```<your domain>.md```.
3. Read the data fields and change the entries. You can use existing entries as
   examples. If you do not need an *optional* field, remove it (for example, if
   you do not have an RSS feed, remove the ```feed:``` line entirely).
4. Open a PR.

### To add an announcement

Create a markdown file in ```_posts``` following ```YYYY-MM-DD-title.md```. YAML
frontmatter should be similar to all other posts.

### To run a dev copy

#### Manually

1. Install Ruby and Bundle
2.
```bash
./runlocal.sh
```
This should autoinstall the bundle gems and run all needed scripts to properly
render the site.

#### With Docker

If you have Docker set up on your system, you can run `docker-compose up [-d]`
(include the `-d` flag to run in background). This will build the Docker image,
including dependencies, and run the site at `localhost:4000`.

### To deploy

Deployment is automatic on commit. If any further dependancies/plugins are added
(ideally using ```bundle add```) make sure to add it to the Gemfile since they
are installed at runtime in the Github Actions pipeline.

### Automatic commits

The Actions pipeline from
[rsscombine](https://github.com/uoftwebloggingclub/rsscombine) pushes an updated
RSS feed which triggers a site rebuild on every meaningful feed update (aka
anything but "last updated"). This is used to generate feed previews on the
website and host the full version on neocities under /feed.xml.
