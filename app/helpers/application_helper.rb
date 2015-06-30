module ApplicationHelper
	# Returns the full title on a per-page basis.
	require 'twitter-text'
	include Twitter::Autolink
 
	  def twitter_text(text)
	    text = auto_link(text)
	    text ? text.html_safe : ''
	  end

  def full_title(page_title = '')
    base_title = "iZone"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
