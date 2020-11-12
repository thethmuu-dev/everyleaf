User.create!(email: 'thet@gmail.com',
             name: 'thet',
             password: 'thetthet')

User.create!(email: 'yee@gmail.com',
             name: 'yee',
             password: 'yeeyee')

User.create!(email: 'admin@gmail.com',
             name: 'admin',
             password: 'adminadmin',
             is_admin: true)

tasks = ['Go Shopping', 'Work', 'Meet', 'Code']
tasks.each do |task|
    Task.create!(title: task,
                details: 'Description of Task',
                expired_at: '2020-11-06',
                status: 'Incompleted',
                priority: 'Medium',
                user_id: 1)
end

labels = ['Routine', 'Work Related', 'Health', 'Social']
labels.each do |label|
    Label.create!(name: label,
                user_id: 1)
end

4.times do
LabelTask.create!(label_id: Faker::Number.between(from: 1, to: 4),
                task_id: Faker::Number.between(from: 1, to: 4))
end