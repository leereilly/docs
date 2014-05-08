module CustomHelpers
  def grouped_articles
    sitemap.resources.find_all{|p| p.source_file.match(/articles\/.*\.html/)}.group_by{|p| replace_with_whitespace p.path.split('/')[1]}
  end

  def article_title article
    article.data.title || replace_with_whitespace(article.path.split('/').last.gsub '.html', '' )
  end

  def replace_with_whitespace string
    string.gsub(/[-_]/, ' ')
  end

  def category_to_title category
    category.gsub(/[-_]/, ' ').capitalize
  end

  def to_id string
    string.gsub(/[-_]/, '_').downcase
  end

  def page_title title
    if title
      "#{title} - Codeship Documentation"
    else
      "Codeship Documentation"
    end
  end

  def list_item_for_category category
    category_container = Array.new
    category_pages = Array.new

    category_container << link_to(category, category_path(category), class: :title)

    sitemap.where(category: category).all.each_with_index do |article, i|
      if article.published?
        category_pages << "<li>#{link_to article_title(article), article}</li>"
      end
    end

    category_container << "<ul class='category-list'>" + category_pages.join(" ") + "</ul>"
    return "<div class='category-item'>" + category_container.join(" ") + "</div>"
  end

  def breadcrumbs
    res=Array.new
    res << "#{link_to "Documentation", "/index.html"}"
    tree = current_page.request_path.gsub(/index\.html/, "").split("/")
    for i in 0..(tree.length - 1)
      next if tree[i] == TAGLINK
      page_path = tree[0..i].join("/") + "/index.html"
      page = sitemap.find_resource_by_destination_path page_path
      res << "#{link_to article_title(page), page}" unless page.nil?
    end
    return "<nav class='breadcrumbs'>" + res.join(" ") + "</nav>"
  end

  def docs_link_to text, url
    path = url.downcase
    if !url.include?("/index.html")
      path = url[url.size-1] == "/" ? url + "index.html" : url + "/index.html"
    end

    page_path = sitemap.find_resource_by_destination_path(path)
    if page_path.nil?
      return text
    else
      return link_to text, page_path
    end
  end

  def man_link_to text, man_page, section = 1
    link_to text, "http://manpages.ubuntu.com/manpages/#{config[:ubuntu_version]}/en/man#{section}/#{man_page.downcase}.#{section}.html"
  end
end
