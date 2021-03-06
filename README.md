Ruby Engineer Coding Challenge
=======================

## What are all this shit?

Hello guys, I'm Vinicius and this is my solution to the problem that you
brought to me :D

My solution consists of two endpoints, one is the `POST /distance`, for create
new routes or update if the route was registered before.

The second endpoint is the `GET /cost?origin=X&destination=Y&weight=K`, to
check the value to deliver a package with K kg from X to Y.

On the first part, I created a Service (`DistanceSanitizeService`) to manipulate
the request raw data and return a hash to create a `Distance`;

On the second part, I created a service (`CostService`), to find the much
cheapest route between X and Y returning the cost.
To find the best route I used the Dijkstra gem, that uses a matrix to
find the best path, best is: Less kilometer.

On my first attempt to create the project I tried to create an algorithm on my own and
create the API with only Ruby (without framework), but I would exceed the
deadline (Like what I'm doing now kkk).

For database I choose the PG because of Heroku.

## Configuration

Ruby version: 2.4.3

Rails version: 5.1.5

## How to

To run install `docker` and `docker-compose` on your machine:
`sudo pacman -Sy docker docker-compose --noconfirm`

for Arch and derivates

and build the container with:
`docker-compose build`

after build:
`docker-compose run --service-ports --rm web bash`

Inside the container run:
`rails db: create db: migrate db: seed`

`db:seed` will populate the db with all combination of letters and random gaps

After all: `rails s`

In docker-compose I'm exporting 3000 port of container to 80!
You can access on: `localhost`.

## For lazy people like all oldscholl programmers and I, even I being a noob

[CLICK HERE!](https://rakuten-backend-code-challenge.herokuapp.com)

## POST Problem

`Get` it's cool, you can do anywhere, if you have internet.
But `POST` you need some tools to do the job
The most simple for doing this, in my opinion, it's `wget`

Doing:
`wget -qO- https://rakuten-backend-code-challenge.herokuapp.com/distance --post-data "a b 100"`

You will get the json on your screen, like a hacker!

Enjoy and hire me, please (͡ ° ͜ʖ ͡ °)

  ==============================================================

Hello!

We've come up with this relatively open-ended programming/engineering challenge that will allow you to demonstrate your skills from the comfort of your own workspace. In addition, we know your time is valuable, so please feel free to use your completed work as a portfolio piece.

We wish you the best of luck and can't wait to see what you create!

## Overview

Your goal is to develop a system to calculate the shipping cost for products of an order, based on it's weight and distance from origin to destination. The distribution points will be supplied to this system throught an API and the shipping cost will be calculated in another API, always aiming at the lowest cost to the customer.

To populate the database, another system will call the API informing the distance (in kilometers) between *origin* and *destination* of two distribution points. For example:
```
POST /distance
A B 10
```
```
POST /distance
B C 15
```
```
POST /distance
A C 30
```

In a second moment, the shopping system will call the API informing the total weight of the order, the source and destination points. The system should return the lowest shipping cost, using the formula: `cost = distance * weight * 0.15`. For example:

```
GET /cost?origin=A&destination=C&weight=5
18.75
```

Explanation: the shortest path from A to C is A -> B -> C = 25km. `cost = 25 * 5 * 0.15 = 18.75`

## Considerations

* The input format of distance should have the format `A B X`, where *0 < X <= 100000*. Wrong format or data should return an error;
* If a distance point already exists, should be replaced with the new value;
* The cost API should validate the given points and weight, where *0 < wheight <= 50*. If no path was found between *origin*  and *destination*, and error should be returned;
* The solution should be implemented in Ruby. You could use the frameworks that you're most used to.
* Both APIs will receive a large amount of requests: choose the design and technology wisely;

## Submission

You can follow the GitHub Fork/Pull Request workflow by [forking this repository](https://github.com/RakutenBrasil/backend-code-challenge/fork), commiting your changes, and submiting a pull request to us, explaning your solution, technical decisions and how configure/use on the README file. For more information about that, you can see this [GitHub article](https://help.github.com/articles/fork-a-repo/#propose-changes-to-someone-elses-project).

## What we are looking for

We are looking for several things with this challenge. First, of course, we're looking for your answer to be technically correct. Beyond that, we're also looking for:

* Is your code easy to read and understand?
* Are you following the usual conventions for Ruby development?
* How good are you at writing tests? And how easy are they to read and understand?
* Did you follow these directions?

We will of course **examine your code to see its correctness, readability, general elegance, architectural decisions, and modularity**. If/when you meet with us, be prepared to talk about why and how you design your solution. We also test your system with a large amount of data to mesure the performance and to see if we can break stuff.

That's it. There aren't any hidden gotchas or trick questions. That's really what we're going to do.

## License

We have licensed this project under the MIT license so that you may use this for a portfolio piece (or anything else!).

