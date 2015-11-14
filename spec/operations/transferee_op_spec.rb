require "rails_helper"

RSpec.describe TransfereeOp do

  let(:package1) { create(:package1) }
  let(:package2) { create(:package2) }
  let(:city) { create(:city) }
  let(:hr_with_packages) {
    create(:hr, packages: { "#{package1.id}": 1, "#{package2.id}": 2 })
  }

  let(:transferee) { create(:transferee) }

  it 'index' do
    params = {
      user_id: hr_with_packages.id
    }
    transferees = described_class.index(params)
    expect(transferees.size).to eq(0)

    transferee.hr = hr_with_packages
    transferee.save

    expect(described_class.index(params).size).to eq(1)
  end

  it 'create' do
    expect(hr_with_packages.transferees.size).to eq(0)
    params = {
      user_id: hr_with_packages.id,
      transferee: {
        email: "random@email.com",
        firstname: 'firstname',
        lastname: 'lastname',
        position: 'CEO',
        start_date: Date.today,
        shared_budget: 1000,
        city_id: city.id,
        package_id: hr_with_packages.packages.keys.first.to_s,
      }
    }
    res = described_class.create(params)
    expect(res.valid?).to be true

    expect(Hr.find(hr_with_packages).transferees.size).to eq 1
  end

  it 'doesnt create if email already exists' do
    expect(hr_with_packages.transferees.size).to eq(0)
    params = {
      user_id: hr_with_packages.id,
      transferee: {
        email: transferee.email,
        firstname: 'firstname',
        lastname: 'lastname',
        position: 'CEO',
        start_date: Date.today,
        shared_budget: 1000,
        city_id: city.id,
        package_id: hr_with_packages.packages.keys.first.to_s,
      }
    }
    res = described_class.create(params)
    expect(res.valid?).to be false
  end

  it 'update' do
    params = {
      user_id: transferee.id,
      id: transferee.id,
      transferee: {
        second_email: "some email",
        phone: "some value",
        birthdate: "some value",
        nationality: "some value",
        position: "some value",
        start_code: "some value",
      }
    }
    res = described_class.update(params)
    expect(res.valid?).to be true
    expect(User.find(transferee.id).second_email).to eq("some email")
  end
end
