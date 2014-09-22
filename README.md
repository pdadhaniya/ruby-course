Songify is an application built with Ruby, PostgreSQL, and Sinatra. Songify is used to add genres, artists, and songs to a database. Additionally, all genres, artists, and songs can be viewed and edited. Each song is saved to the database with one genre and at least one genre. The purpose of building Songify was to increase knowledge about Ruby, databases, writing RSpec tests and to learn about using Sinatra to build web applications and about RESTful routing.

If this project was re-done, I would have done a few things different.
  - I would initialize my entities with params to make it much easier to add attributes later on without having to re-write many tests.
  - I would utilize a layout file so I wouldn't have to write the same HTML code repeatedly
  - I would incorporate a build entity method into my repo files
  - I would make a repo class that each repo would inherit from to reduce the number of times I explicitly write out the code to connect to the database
  - I would plan out the connections between all tables in the database before starting so that I would not have to go back and repeatedly recreate the tables with foreign keys referencing other tables