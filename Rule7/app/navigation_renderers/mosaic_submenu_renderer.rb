class MosaicSubmenuRenderer < SimpleNavigation::Renderer::Base

  def render(item_container)
    list_content = item_container.items.inject([]) do |list, item|
      li_options = item.html_options.reject { |k, _| k == :link }

      # Gera o conteúdo do LI
      li_content = tag_for(item)

      # Adiciona a classe todos os <li>
      li_options[:class] = add_class(li_options[:class], 'sovos-nav-links-item')

      # Verifica se o item possui sub-navegação
      if include_sub_navigation?(item)
        # Caso tenha sub-menu, adiciona a classe has-sub aos <li>
        li_options[:class] = add_class(li_options[:class], 'dropdown')
        li_content << render_sub_navigation_for(item)
      end

      # Adiciona o li a lista e itens
      list << content_tag(:li, li_content, li_options)
    end.join

    if skip_if_empty? && item_container.empty?
      # Se o container for vazio, não deve retornar elementos.
      ''
    else
      # item_container.level == 1
      list_class = add_class(item_container.dom_class, 'sovos-nav-links')
      list_type = options[:ordered] ? :ol : :ul
      content_tag(list_type, list_content, id: item_container.dom_id, class: list_class)
    end
  end

  # Helper para adicionar novas classes a lista(string) de classes existentes
  def add_class(class_list, new_class)
    class_list ||= ''
    class_list.split(' ').push(new_class).join(' ')
  end

  # sobrescreve o comportamento da classe herdada
  def tag_for(item)
    link_options = link_options_for(item)
    content = []

    content << link_icon(link_options)
    content << content_tag(:span, item.name)

    link_options[:class] = add_class(link_options[:class], 'sovos-nav-links-link')

    if include_sub_navigation?(item)
      link_options[:class] = add_class(link_options[:class], 'sovos-nav-has-sublinks')
    end

    link_url = suppress_link?(item) ? 'javascript:void(0)' : item.url

    link_to content_list_to_html(content), link_url, link_options
  end

  def render_sub_navigation_for(item)
    content = []
    item.sub_navigation.items.each do |sub_item|
      link_options = link_options_for(item)
      link_options[:class] = add_class(link_options[:class], 'sovos-nav-links-link')
      link_content = []
      link_content << link_icon(link_options)
      link_content << content_tag(:span, sub_item.name)
      content << link_to(content_list_to_html(link_content), sub_item.url, link_options)
    end

    content_tag(:div, content_list_to_html(content), class: 'sovos-nav-sublinks-container')
  end

  def content_list_to_html(list_content=[])
    list_content.join.html_safe
  end

  def link_icon(link_options)
    # icon_class = link_options.delete(:icon)
    # content_tag(:i, icon_class || "chevron_right", class: 'material-icons')
  end
end 