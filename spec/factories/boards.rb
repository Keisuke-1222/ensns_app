FactoryBot.define do
  factory :board do
    title "test title"
    body "test body"
    association :user
  end
end
