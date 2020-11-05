# Everyleaf task

## Table Schema

- model name
  - Task

| column name | data type |
| ----------- | --------- |
| title       | string    |
| dealine     | string    |
| status      | string    |
| priority    | string    |
| user_id     | integer   |
| label_id    | integer   |

  - Label

| column name | data type |
| ----------- | --------- |
| name        | string    |

  - User
  
| column name | data type |
| ----------- | --------- |
| name        | string    |
| email       | string    |

## The Deployment Procedure to Heroku

- precompile the assets
  <pre>rails assets:precompile RAILS_ENV=production</pre>

- commit the code changes to github
  <pre>git add .</pre>
  <pre>git commit -m ""</pre>

- create the heroku app
  <pre>heroku create</pre>

- add the buildpack
  <pre>heroku buildpacks:set heroku/ruby</pre>
  <pre>heroku buildpacks:add --index 1 heroku/nodejs</pre>

- delploy to heroku
  <pre>git push heroku master</pre>

- run db migration
  <pre>heroku run rails db:migrate</pre>

- check the app configurations
  <pre>heroku config</pre>