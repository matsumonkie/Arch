require "rails_helper"

RSpec.describe ChildOp do

  let(:child) { build(:child) }
  let(:user_with_children)    { create(:transferee, children: [child]) }
  let(:user_without_children) { create(:transferee) }

  it 'create' do
    params = {
      user_id: user_without_children.id,
      child: {
        firstname: "A",
        lastname: "B",
        birthdate: Date.today,
      }
    }

    expect(user_without_children.children.count).to eq(0)
    form = ChildOp.create(params)
    expect(form.valid?).to be true
    expect(Transferee.find(user_without_children).children.count).to eq(1)
  end

  it 'update' do
    params = {
      user_id: user_with_children.id,
      id: child.id,
      child: {
        firstname: "Lya",
        lastname: "B",
        birthdate: Date.today,
      }
    }

    expect(user_with_children.children.first.firstname).to eq(child.firstname)
    form = ChildOp.update(params)
    expect(form.valid?).to be true
    expect(form.firstname).to eq("Lya")
  end

  it 'delete' do
    params = {
      user_id: user_with_children.id,
      id: child.id,
    }

    expect(user_with_children.children.count).to eq(1)
    form = ChildOp.delete(params)
    children = User.find(user_with_children).children
    expect(children.count).to eq(0)
  end
end
