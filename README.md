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