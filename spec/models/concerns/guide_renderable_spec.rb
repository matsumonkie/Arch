require 'rails_helper'

RSpec.describe GuideRenderable, :type => :model do

  let(:guide) { create(:guide) }

  it "create a menu" do
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

    expect(guide.menu()).to eq expected_res
  end

  it 'find the index of a section' do
    document = guide.document
    expect(document.find_index("title1")).to   eq ({ index: '1' })
    expect(document.find_index("title1.1")).to eq ({ index: '1-1' })
    expect(document.find_index("title2")).to   eq ({ index: '2' })
    expect(document.find_index("whatever")).to eq ({ index: nil })
  end
end
