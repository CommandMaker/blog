## Structure of the repo

The site use Symfony 7.4 but with a different file structure.
The `src/` directory is organized using this architecture :
- `Http/` : Here you'll find everything related to HTTP requests such as controllers, middlewares, ...
- `Domain/` : Here you'll find everything related to application structure (services, entities, repositories)
- `Core/` : Contains everything abstract such as interfaces, and other obscur things that works (probably) so I don't touch so much
- `Infrastructure/` : Contains class to allow the domain to work with the system (email sending, database, ...)

## Why

The goal was to fix the main problem of the default structure of the framework : everything is splitted between folders.
Take an example : You wanna implement a user login & register system. You're gonna make an User entity, a repository, a service to manage user actions such as login, create user, ... You may even want to dispatch an event when the user register (to send an email validation email) or login (to notify the login). So your gonna have the entity and its repository (2 separated folders), the events and their subscribers (2 folders) and the service (another folder or even directly in the controllers). In total, you split the code in more or less 4 or 5 differents folders. Here, everything would be under `src/Domain/User`. This is more simple (at least to me).

You can learn more about the structure (here)[https://github.com/Grafikart/Grafikart.fr/blob/master/docs/structure.md] (I use his code a lot as an inspiration).
