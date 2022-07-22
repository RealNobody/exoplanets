# README

## Setup

* Get code
    Unzip file from email or git the code
  ```
  git clone git@github.com:RealNobody/exoplanets.git
  cd exoplanets
  ```
* Install Gems
  ````
  bundle install
  ````
* Run tests
  ````
  bundle exec rspec
  ````
* Lauch website
  ````
  bundle exec rails server -b 0.0.0.0 -p 3000 -e development
  ````
* Visit the website: [http://0.0.0.0:3000](http://0.0.0.0:3000)

  The website is a single page app that shows the requested information on the page as simple plain text (no frills).
  The only bonus abilities added are a refresh link at the bottom of the page which will reload the data.  Otherwise
  the site only loads the data once and just keeps re-showing the values from in-memory until the site is re-launched.

## Questions
* Why did you make the design choices you made?
  * I created an single instance "DB" object so I wouldn't have to mess around with storing
    variables of the read in JSON in the ERB or the controller somewhere.  I just have a
    Singleton class with the data and I can always reference that.
  * I used RSPEC for tests because I'm familiar with it
  * I created a HottestStars query because the logic was a bit more complicated.  There isn't
    anything which would guarantee a single value, so I made it an array and sorted it.
  * I did NOT create a query for the count of orphaned planets because it is so straight forward.
    Depending on team preferences I would leave that as-is or change it to a query object like
    HottestStars.  Till I learn the team coding style things like this are kind of random...
  * I made AnnualDiscoveriesByYear a query because it fetches and aggregates exoplanet information.
  * I created the AnnualDiscoveries and Exoplanet classes to encapsulate data structures with methods
    that simplify the code.
  * Most of the code is base RoR new app scaffolding.  I didn't bother to remove unused portions of
    scaffolded code because it just wasn't really  relevant for a "quick and dirty" app.
  * I wanted to make a good impression so I did spend some time tidying up the code to look nice.
* What assumptions did you make and why?
  * I assumed that the style of the output was not too important because little to nothing was
    said about it and this is a "coding challenge" not a style challenge.  (I still tried to make
    easy to read/nice-ish.)
  * I assumed that I didn't have to get too anal with error handling.  There weren't a lot of places
    where errors could happen, and I put some handling in place.  For a more-robust, time spent app
    I would put in better error handling.
  * I assumed that missing or blank ("") values could be reasonably defaulted to 0 in most cases.
    This resulted in unknown planets being "small" by default, but there were no instructions on
    what to do with/about missing data.  This should be handled in story grooming, or if missed there
    would be brought up to the product owner for a decision rather than just being done like I did here.
  * I assumed that there wouldn't be so many exoplanets that we couldn't hold all of them in memory.  It
    made my life simpler that way.
* Why did you choose not to do some things?
  * The instructions say to not do a fully polished program, just get it done to see your coding style.
    That meant to me that some more in-depth error handling, code coverage and things like that weren't
    needed at this time.
  * I didn't bother to use a fully fleshed out model object and just used the hash as it comes in whenever
    possible as a simple time saver.  I don't need to alias `PlanetIdentifier` as `id` for a small
    project like this.
  * I didn't delete default scaffolded classes and files because it felt out of the scope of the
    quick and dirty instructions.
  * I didn't create separate views/routes for the different data because I was being lazy.
