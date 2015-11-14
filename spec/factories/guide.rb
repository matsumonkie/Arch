FactoryGirl.define do
  factory :guide do
    city 'montreal'
    title 'montreal_fr'
    document {
      Section.new(
        title: "main_title",
        child_sections: [
          FactoryGirl.build(:section,
                            title: 'title1',
                            child_sections: [
                              FactoryGirl.build(:subsection, title: 'title1.1'),
                              FactoryGirl.build(:subsection, title: 'title1.2') ]),
          FactoryGirl.build(:section, title: 'title2')
        ]
      )
    }
  end
end
