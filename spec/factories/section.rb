FactoryGirl.define do
  factory :section do
    title "<h1 id='title'> title </h1>"
    text "<p> text for h1 </p>"

    factory :subsection do
      title "<h2 id='subtitle'> subtitle </h2>"
      text "<p> text for h2 </p>"
    end
  end
end
