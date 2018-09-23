FactoryBot.define do
  factory :note do
    title "test note"
    body "test note body"
    association :user
  end
end
