package WWW::PDAScraper::Yahoo::Health::SeniorsAndAging;

# PDAScraper.pm rules for scraping the
# Yahoo Health SeniorsAndAging page

sub config {
    return {
        name       => 'Yahoo Health SeniorsAndAging',
        start_from => 'http://news.yahoo.com/i/1428',
        chunk_spec => [ "_tag", "div", "id", "indexstories" ],
        url_regex => [ '$', '&printer=1' ],
        link_spec => [sub { $_[0]->attr('href') =~ m|^/s| }] 
        # Yahoo's actual stories are in a "/s/" directory.
        # making it easy to eliminate photos, javascript, 
        # external links, etc.
    };
}

1;