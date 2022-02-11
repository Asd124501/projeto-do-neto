module ApplicationHelper
    def page_title(title)
        # content_tag('h2', title)
        content_for(:page_title, title, class: "sovos-page-title")
    end  
end
