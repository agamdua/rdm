# RDM

Tool for Release & Deploy Management

## Current Feature

Inspects the release.yml file and gives the versions of the dependencies.

```
# example .release.yml
dependencies:
  - service1:
    - version: 1.2.1 
    - repo_url: xyz.git
    - optional: true

  - service2:
    - version: 2.4.6 
    - repo_url: abc.git
    - optional: false
```


```
$ ./rdm --deps --config test/example-release.yml 
[{"service1", "1.2.1"}, {"service2", "2.4.6"}]
```

Also exploring the possibility of making this available without the need
for the Erlang runtime to be explicitly installed.

Hopefully with the help of [Distillery](https://github.com/bitwalker/distillery)
which promises:

> it takes your Mix project and produces an Erlang/OTP release, a distilled form of your raw application's components; a single package which can be deployed anywhere, independently of an Erlang/Elixir installation. No dependencies, no hassle.

This is more heavy handed than needed for a CLI though, need to explore options.
