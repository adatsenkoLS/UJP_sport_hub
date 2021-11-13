module ArticlesHelper
  def get_first_paragraph(content)
    index_of_close_tag_of_paragraph = content.index(%r{(</p>)}mi).to_i + 3
    content[0..index_of_close_tag_of_paragraph]
  end
end
