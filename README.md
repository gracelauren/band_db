Band DB
================

by Grace Mekarski

Band DB is a website that uses ActiveRecord and Sinatra to allow users to add bands and on a band's page the user can check the venues they played add.

Installation
------------

Install Band DB by first cloning the repository.  
```
$ git clone http://github.com/gracelauren/band_db.git
```

Install all of the required gems:
```
$ bundle install
```

Start the database in another tab of the terminal:
```
$ postgres
```

Create the databases and tables by cd-ing into your band_db folder then in the terminal run the following:

```

```
$ rake db:create

```

```
$ rake db:schema:load

```

```
$ rake db:test:prepare
```

```
```

Start the webserver:
```
$ ruby app.rb
```

In your web browser, go to http://localhost:4567

License
-------

GNU GPL v2. Copyright 2015 Grace Mekarski
