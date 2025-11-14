SitemapGenerator::Sitemap.default_host = "https://yourdomain.com"
SitemapGenerator::Sitemap.create do
  # Homepage
  add root_path, priority: 1.0, changefreq: 'daily'

  # Posts index
  add posts_path, priority: 0.9, changefreq: 'daily'

  # Individual posts
  Post.published.find_each do |post|
    add post_path(post), 
        lastmod: post.updated_at,
        priority: 0.8,
        changefreq: 'weekly'
  end

  # Static pages (if you have any)
  # add about_path, priority: 0.7, changefreq: 'monthly'
end