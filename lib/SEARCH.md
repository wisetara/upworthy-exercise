Assignment
- - - - -

Using a combination of research and your own experience, describe how you'd build this feature.
Which technologies would you use? How would you go about implementing?

Time limit: 60 minutes, both researching and writing the answer.

Well, the company with which I spent the most time working used Elasticsearch quite a bit among
the consumer-facing website and internal apps.

Unless faced with a compelling reason, I'd probably pursue that first in my research. Reasons:
* It's open source. I'm a big fan of using and supporting open source projects.
* I already know it was selected by a number of large companies (e.g. Etsy, Foursquare,
  LivingSocial, Netflix)for their website, which SUGGESTS that people have already vetted it
  as a solution. I might ask engineers I know at companies I know who use it if they know
  about that process and other things they considered (I've heard Apache Solr, to)
* It's a REST API with JSON (and the Java API), and since it uses JSON, we know the data will be something
  we can likely work with easily, even if folks go wild and decide the whole app is changing
  languages or something. Moreover, it's very customizable.
* Elasticsearch can be extended via APIs and DSLs, so that's nice.

Things to consider:
* Elasticsearch uses Java and Gradle. Do I have fellow engineers who know one or
  both of these?
  Do we need to know these, or do we just need them installed? What are the implications of
  using a product that relies on tech knowledge we might not have?
* NOTE: A review of the elasticsearch code reveals an easy 7-line cheatsheet for Gradle,
  suggesting that Gradle-knowledge is not a big hinderance.
* There is a lot to learn with Elasticsearch. The good news is that the company (now called
  Elastic) does have a lot of information available. I found their blog particularly helpful,
  especially https://www.elastic.co/blog/found-elasticsearch-in-production. There are also a
  number of tutorials out there.

To get started with the actual implementation (let's assume much reading/learning/tutorialing
has been happening), here is how I might think about it/approach it. These depend on what
we've already got in play, of course (so these things might be irrelevant):
* I'm going to need something to install dependencies, like Node.js NPM
* We'll need some client-side scaffolding if we don't have any (I'm guessing we would)
* I'm guessing there's already a JS library for building the UI that will display the data.
  We'll need that.
* Other assumptions I'm making: Ruby. Rails. Ability to build API layers.
* And then Elasticsearch itself, any client it needs for loading data (provided one isn't
  using it as a database, which is <strike>probably</strike> not a good long-term strategy.)
  (I meant to leave those HTML tags there.)
* We're going to need some test data. Hopefully, there's a nice development database available.

THE WORK:
* We get Elasticsearch loaded and the server running.
* We import our data (test data, I would think)
* There are tutorials on this, but we generate some boilerplate code through a number of
  different possibilities.
* Now it starts getting exciting. We add a route into our server.
* We build an Elasticsearch service. (Do you like how that sounds like one easy step?)
* Now, we start working with the front-end and the controller! w00t!
* We do SO MUCH TESTING all the way along.
* We fix things. We refactor things. We add features we didn't think of before.
  We do all the things. We keep testing all the things.
* It probably doesn't go this smoothly. But the not going smoothly? That's actually what they
  pay us for (in my opinion). We stick with it. We don't give up. We keep going. We work
  together. It is amazing. We get a new assignment. :-)

