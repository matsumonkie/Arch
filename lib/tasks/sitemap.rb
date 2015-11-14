require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'https://settle-in.com'
SitemapGenerator::Sitemap.create do
  add '/s/product'
  add '/s/request_demo'
  add '/s/about_us'
end
SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks
