FactoryBot.define do
  factory :task do
    title { 'Read Diver' }
    status { 'Incompleted' }
    deadline { 'Nov 7' }
  end

  factory :task2, class: Task do
    title { 'Write Codes' }
    status { 'Incompleted' }
    deadline { 'Nov 7' }
  end
end