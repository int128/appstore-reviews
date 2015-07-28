# App Store XSLT

A XML stylesheet to transform App Store XML into app metadata and reviews.


## Getting Started

Let's start with `curl` and `xsltproc` command.
It is available on OS X and most Linux.

```sh
# Google Inbox
app_id='905060486'

# App Store in Japan, language in English
app_zone='143462-1'

# Download App Store XML
curl -o appstore.xml \
  -L \
  -H "X-Apple-Store-Front: $app_zone" \
  -A "iTunes" \
  "https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=$app_id&pageNumber=0&sortOrdering=4&onlyLatestVersion=false&type=Purple+Software"

# Transform XML
xsltproc appstore.xslt appstore.xml
```

Output will be like following.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<app xmlns:i="http://www.apple.com/itms/" name="Inbox by Gmail - a new email app that works for you" category="Category: Productivity" updated="Updated Jul 15, 2015" size="© 2014, Google Inc">
  <review title="..." stars="2" author="..." version="Version 1.3.4" date="Jul 26, 2015" id="viewVote12345678">...</review>
</app>
```

See also [Scraping AppStore Reviews](http://blogs.oreilly.com/iphone/2008/08/scraping-appstore-reviews.html) for details of URL and HTTP headers.


## Language specific

TODO

