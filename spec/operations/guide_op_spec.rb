require "rails_helper"

RSpec.describe GuideOp do

  let(:guide) { create(:guide) }

  it 'fetch menu' do
    params = {
      guide_title: guide.title
    }
    menu = described_class.menu(params)
    expected_res = [
      { title: "main_title", sections: [
          { title: "title1", sections: [
              { title: "title1.1", sections: []},
              { title: "title1.2", sections: []}
            ]
          },
          { title: "title2", sections: []}
        ]
      }
    ]
    expect(menu).to eq (expected_res)
  end

  it 'index_from_title' do
    params = {
      guide_title: guide.title,
      title: 'title1.2',
    }

    res = described_class.index_from_title(params)
    expect(res).to eq({ index: '1-2' })
  end

  it 'search' do
    params = {
      guide_title: guide.title,
      text: 'text for h'
    }

    res = described_class.search(params)
    expect(res.class).to eq Hash
    expected_res = {
      "1" => {:title=>"title1", :content=>"<p> text for h1 </p>..."},
      "1-1" => {:title=>"title1.1", :content=>"<p> text for h2 </p>..."},
      "1-2" => {:title=>"title1.2", :content=>"<p> text for h2 </p>..."},
      "2" => {:title=>"title2", :content=>"<p> text for h1 </p>..."},
    }
    expect(res).to eq(expected_res)

    params = {
      guide_title: guide.title,
      text: 'text for h1'
    }

    res = described_class.search(params)
    expected_res = {
      "1" => {:title=>"title1", :content=>"<p> text for h1 </p>..."},
      "2" => {:title=>"title2", :content=>"<p> text for h1 </p>..."},
    }
    expect(res).to eq(expected_res)
  end
end
