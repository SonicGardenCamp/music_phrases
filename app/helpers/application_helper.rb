module ApplicationHelper
end

def bootstrap_paginate_renderer
    Class.new(WillPaginate::ActionView::LinkRenderer) do
      def container_attributes
        {class: "pagination"}
      end
  
      def page_number(page)
        unless page == current_page
          tag(:li, link(page, page, rel: rel_value(page)), class: 'page-item')
        else
          tag(:li, link(page, page, rel: rel_value(page)), class: 'page-item active')
        end
      end
  
      def gap
        tag(:li, link(super, '#'), class: 'page-item disabled')
      end
  
      def previous_or_next_page(page, text, classname)
        if page
          tag(:li, link(text, page, class: 'page-link'), class: ['page-item', classname])
        else
          tag(:li, link(text, '#', class: 'page-link'), class: ['page-item', classname, 'disabled'])
        end
      end
  
      def html_container(html)
        tag(:ul, html, container_attributes)
      end
    end
  end
  
  