module SearchGuideRole

  def search(text)
    nodes = children_with_level(self.document)
    res = {}
    while(nodes.any?)
      node = nodes.shift
      nodes = children_with_level(node[:section], node[:level]) + nodes
      if contains?(node[:section].title, text) or contains?(node[:section].text, text)
        res[node[:level]] = {
          title: node[:section].title,
          content: node[:section].text.first(140) + "..."
        }
      end
    end

    res
  end

  def contains?(text, searched_text)
    match = text =~ /#{searched_text}/i
    not(match.nil?)
  end

  def children_with_level(node, parent_level = nil)
    node.child_sections.each_with_index.map { |section, i|
      level = [parent_level, (i + 1).to_s].compact.join('-').to_s

      { level: level, section: section }
    }
  end
end
