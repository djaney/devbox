# devbox
vagrant box for web development services.

This contains only stuff that I don't want to pollute my host machine with.

Why no PHP? I run PHP on the host machine using `php -S` mainly because it's very slow when I run symfony (or any big project) in the shared folder.
Why no NPM? I also run NPM in the host because it has issues running in shared folders.

## Services
1. MySQL - port: 3306, user: root, password: 1234
1. Beanstalkd - port: 11300
1. MongoDB - port: 27017
1. Redis - port: 6379

__watch out for port conflicts__
