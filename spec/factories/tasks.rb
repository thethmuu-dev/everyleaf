FactoryBot.define do
  factory :task do
    title { 'Read Diver' }
    status { 'Incompleted' }
    expired_at { '2020-11-06 20:08:00 +0630' }
    priority { 'Low' }
    user_id { 1 }
  end

  factory :task2, class: Task do
    title { 'Write Codes' }
    status { 'Incompleted' }
    expired_at { '2020-11-06 20:08:00 +0630' }
    priority { 'Low' }
    user_id { 1 }
  end
end