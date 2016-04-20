# remember_app

Rails app that allow users to list their own vehicles, add information and get email reminders about main deadlines.

This is a dummy project I use to learn and play with interesting web technologies.

Ruby 2.2.3
Rails 4.2.5

[Live demo](https://damp-wave-59763.herokuapp.com)

## things I learnt through this project

- use heroku to deploy a rails app
- use git
- use heroku scheduler to send email when some conditions happen
- use sendgrid to send transactional emails
- use bootstrap to get a fully responsive design
- register and authenticate users through gem devise
- use of nested resources
- restrict some actions to admins only (e.g, delete users)
- use Ajax to delete users from users list w/o refreshing the page
- displaying flash messages
- allow images uploading
- internationalize the website

## future goals

- internationalize emails (send emails using user's custom set language)
- enable images saving to AWS
- use background jobs queues (mail?)
- integrate some API
- build a RESTful API
- use some REACT components
- realtime application (create a car in a view, and you see it in the same view on another windows)