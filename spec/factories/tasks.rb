FactoryBot.define do
  factory :task do
    # Please change the following contents according to the column name actually created
    title { 'New Title' }
    status { 'Incompleted' }
    deadline { 'Oct 3' }
  end

  factory :second_task, class: Task do
    title { 'Title No 2' }
    status { 'Content for No 2' }
    deadline { 'Oct 3' }
  end
end