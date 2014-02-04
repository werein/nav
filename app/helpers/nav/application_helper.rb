module Nav
  module ApplicationHelper
    def navigation navigation, options = {}
      tree = navigation.subtree.arrange(order: :position)
      if options[:theme]
        send("navigation_tree_#{options[:theme]}", tree[navigation], options).html_safe
      else
        navigation_tree(tree[navigation], options)
      end
    end

    def navigation_tree tree_nodes = [], options = {}
      content_tag :ul, class: options[:ul_class] do
        tree_nodes.map do |tree_node, sub_tree_nodes|
          output = '<li>'
          output << link_to(tree_node.title, tree_node.permalink, class: current_page?(tree_node.permalink) ? "current" : "")
          if sub_tree_nodes and sub_tree_nodes.any?
            output << navigation_tree(sub_tree_nodes)
          end
          output << '</li>'
          output
        end.join.html_safe
      end.html_safe
    end

    def navigation_tree_bootstrap tree_nodes = [], options = {}
      options[:ul_class] = 'nav navbar-nav' unless options[:ul_class]
      content_tag :ul, class: options[:ul_class] do
        tree_nodes.map do |tree_node, sub_tree_nodes|
          if sub_tree_nodes and sub_tree_nodes.any?
            options[:ul_class] = 'dropdown-menu'
            case tree_node.depth
            when 1
              output = "<li class=\"dropdown #{'active' if current_page?(tree_node.permalink)}\">"
              caret = ' <b class="caret"></b>' if options[:caret]
            when 2
              output =  '<li class="dropdown-submenu">'
            else
              output = '<li>'
            end
            output << "<a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">#{tree_node.title}#{caret if caret}</a>"
            output << navigation_tree_bootstrap(sub_tree_nodes, options)
          else
            output = "<li #{'class="active"' if current_page?(tree_node.permalink)}>"
            output << link_to(tree_node.title, tree_node.permalink)
          end
          output << '</li>'
          output
        end.join.html_safe
      end
    end
  end
end