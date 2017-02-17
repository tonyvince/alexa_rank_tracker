require 'rails_helper'

RSpec.describe Domain, type: :model do
  it " - cannot create a new domain if user already have 3 domains" do
    user = User.create!(name: "John Doe", email: 'jane@doe.com', password: 'pw1234@123',
    password_confirmation: 'pw1234@123')
    user_domain1 = Domain.create!(name: 'http://example1.com', user_id: user.id,
               created_at: DateTime.now, updated_at: DateTime.now)
    expect(user_domain1.errors).to be_empty
    
    user_domain2 = Domain.create!(name: 'http://example2.com', user_id: user.id,
               created_at: DateTime.now, updated_at: DateTime.now)
    expect(user_domain1.errors).to be_empty
    
    user_domain3 = Domain.create!(name: 'http://example3.com', user_id: user.id,
               created_at: DateTime.now, updated_at: DateTime.now)
    expect(user_domain1.errors).to be_empty
    
    user_domain1 = Domain.create(name: 'http://example4.com', user_id: user.id,
               created_at: DateTime.now, updated_at: DateTime.now)
    expect(user_domain1.errors.full_messages.first).to eq "OOps!!! You have Exceeded maximum domain limit/user (3)"
  end
end
