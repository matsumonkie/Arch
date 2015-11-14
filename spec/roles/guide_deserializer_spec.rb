require 'rails_helper'

RSpec.describe GuideDeserializer, :type => :model do

  let(:raw_guide) { build(:raw_guide) }
  let(:guide) { build(:guide) }

  it 'get section by index' do
    expect(guide.document.get_section('1').title).to eq "title1"
    expect(guide.document.get_section('1-1').title).to eq "title1.1"
    expect(guide.document.get_section('1-2').title).to eq "title1.2"
    expect(guide.document.get_section('2').title).to eq "title2"
  end

  it 'has hierarchy' do
    guide = Guide.new.play(GuideDeserializer) do |guide|
      h1 = Nokogiri::XML.fragment("<h1>coucou</h1>").children.first
      h2 = Nokogiri::XML.fragment("<h2>coucou</h2>").children.first
      s1 = Section.new(title: '<h1>whatever</h1>')
      s2 = Section.new(title: '<h2>whatever</h2>')
      s3 = Section.new(title: '<h3>whatever</h3>')

      expect(guide.parent_or_same_level?(h1, s1)).to be true
      expect(guide.parent_or_same_level?(h1, s2)).to be true
      expect(guide.parent_or_same_level?(h1, s3)).to be true

      expect(guide.parent_or_same_level?(h2, s1)).to be false
      expect(guide.parent_or_same_level?(h2, Section.new())).to be false
    end
  end

  it 'detect paragraph' do
    h1 = Nokogiri::XML.fragment("<h1>coucou</h1>").children.first
    p = Nokogiri::XML.fragment("<p>coucou</p>").children.first
    ol = Nokogiri::XML.fragment("<ol><li>coucou</li></ol>").children.first
    guide = Guide.new.play(GuideDeserializer) do |guide|
      expect(guide.paragraph?(h1)).to be false
      expect(guide.paragraph?(p)).to be true
      expect(guide.paragraph?(ol)).to be true
    end
  end

  it "deserialize" do
    guide = Guide.new
    guide.play(GuideDeserializer) do |guide|
      guide.deserialize(raw_guide.content)
    end
    expect(Guide.first.document.child_sections.size).to eq 1
    expect(Guide.first.document.child_sections.first.child_sections.size).to eq 2
  end

  it 'parse' do
    raw_html = <<-HTML.gsub(/^\s+/, '').gsub(/\n/, '')
    <h1>main title</h1>
    <h2>subtitle</h2>
    <p>foo</p>
    <p>bar<h2>baz</h2></p>
    <h1>2nd main title</h1>
    <p>some text<ul>whatever</ul></p>
    <h3>hey</h3>
HTML

    doc1 = Nokogiri::XML.fragment(raw_html).children.entries

    guide = Guide.new.play(GuideDeserializer) do |guide|
      section = guide.parse(Section.new(), doc1)
      expect(section.title).to eq ''
      expect(section.child_sections.size).to eq 2
      expect(section.text).to eq ''

      # h1
      subsection1 = section.child_sections.first
      expect(subsection1.title).to eq '<h1>main title</h1>'
      expect(subsection1.text).to eq ''
      expect(subsection1.child_sections.size).to eq 1

      # h2
      subsubsection = section.child_sections.first.child_sections.first
      expect(subsubsection.title).to eq '<h2>subtitle</h2>'
      expect(subsubsection.text).to eq '<p>foo</p><p>bar<h2>baz</h2></p>'
      expect(subsubsection.child_sections.size).to eq 0

      # h1
      subsection2 = section.child_sections.last
      expect(subsection2.title).to eq '<h1>2nd main title</h1>'
      expect(subsection2.text).to eq '<p>some text<ul>whatever</ul></p>'
      expect(subsection2.child_sections.size).to eq 1

      # h3
      ssssection = subsection2.child_sections.first
      expect(ssssection.title).to eq '<h3>hey</h3>'
      expect(ssssection.text).to eq ''
      expect(ssssection.child_sections.size).to eq 0
    end
  end
end
