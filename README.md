simple golang hello world server project using [hellogopher](https://github.com/cloudflare/hellogopher) make:

build and run locally:
```
$ make
$ ./bin/gohello03
$ Server at http://localhost:1234.
....
```

build and run using docker:
```
$ docker build -t gohello3:0.0.1 .
$ docker run -p 1234:1234 --name gohello3 gohello3:0.0.1
$ ..... Server at http://localhost:1234.
```

go to
- http://localhost:1234
- http://localhost:1234/magazine/[vogue|natgeo|newyorker]
