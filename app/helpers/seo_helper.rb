# app/helpers/seo_helper.rb

module SeoHelper
  def set_meta_tags_for_post(post)
    set_meta_tags(
      title: post.title,
      description: post.excerpt(160),
      keywords: extract_keywords(post),
      og: {
        title: post.title,
        description: post.excerpt(160),
        type: "article",
        url: post_url(post),
        image: post.featured_image.attached? ? url_for(post.featured_image) : nil,
        article: {
          published_time: post.published_at&.iso8601,
          modified_time: post.updated_at.iso8601,
          author: post.user.name
        }
      },
      twitter: {
        card: "summary_large_image",
        title: post.title,
        description: post.excerpt(160),
        image: post.featured_image.attached? ? url_for(post.featured_image) : nil      
      }
    )
  end

  def set_meta_tags_for_index(query: nil)
    if query.present?
      set_meta_tags(
        title: "Search results for: #{query}",
        description: "Browse blog posts matching '#{query}'",
        noindex: true # Don't index search result pages
      )
    else
      set_meta_tags(
        title: "Recent Blog Posts",
        description: "Discover the latest articles, stories, and insights from our blog community",
        keywords: "blog posts, articles, latest posts, trending articles"
      )
    end
  end

  def structured_data_for_post(post)
    {
      "@context": "https://schema.org",
      "@type": "BlogPosting",
      headline: post.title,
      description: post.excerpt(160),
      image: post.featured_image.attached? ? url_for(post.featured_image) : nil,      
      datePublished: post.published_at&.iso8601,
      dateModified: post.updated_at.iso8601,
      author: {
        "@type": "Person",
        name: post.user.name
      },
      publisher: {
        "@type": "Organization",
        name: "BlogApp",
        logo: {
          "@type": "ImageObject",
        }
      },
      commentCount: post.comments.count,
      mainEntityOfPage: {
        "@type": "WebPage",
        "@id": post_url(post)
      }
    }
  end

  private

  def extract_keywords(post)
    # Extract first few words from title as keywords
    post.title.split.first(5).join(", ")
  end
end