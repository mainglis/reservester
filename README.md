== Lab 1 ==

=== Part 1 ===

Generated the project with:

```
$ rails new reservester
```

Git initialize it with:

```
$ git init
```

Move the README from being rdoc to markdown with:

```
$ git mv README.rdoc README.md
```

=== Part 2 ===

Deployed with:

```
$ git push heroku master
```

=== Part 3 ===

Generated the development and test databases with:

```
$ rake db:create
```

== Lab 2 ==

=== Part 1 ===

Generated the blank resource with:

```
$ rails g resource restaurant
```

Ran the database migration with:

```
$ rake db:migrate
```
