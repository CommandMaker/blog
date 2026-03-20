# Blog

This repo contains the source code for my personal blog hosted at [www.commandmaker.dyjix.fr](https://www.commandmaker.dyjix.fr)
I talk about many things around tech, development and fountain pens. I use this blog as a way to remember many things and share with people. Learn more about this [here](https://www.commandmaker.dyjix.fr/about)

## Frameworks used

The current PHP framework is [Symfony](https://symfony.com) 7.4 using some VueJS for some front-end components.

## What is this src folder ?

I didn't choose the traditional Symfony structure for this project. You can learn more [here](./structure.md).

## Dev

To start the dev server, make sure to have [Docker](https://docker.com) and [Docker Compose](https://docs.docker.com/compose/) installed. Then you can use the `make` commands :

```bash
make dev # Start the dev server
make prepare # Create database and migrate everything
```

## Can I contribute ?

Sure ! I gladly accept pull requests or issues if you encountered a problem on the site or have a suggestion to do.

If you submit a pull request, make sure your code follow the structure of the project (learn more [here](./structure.md)) and pass the linter & tests:

```bash 
make lint
make test
```
