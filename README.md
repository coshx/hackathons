Hackathons
==========
Manage hackathons and judging with ease.

Who doesn't love hackathons?! The goal of this app is to make it easier to
facilitate these fun events, particularly in terms of judging.

The judging model we've taken is to have an admin create a set of possible 
awards for a hackathon, and then have judges nominate various projects for 
these awards.

Currently, it's up to the judge's discretion if he wants to nominate multiple 
projects for the same award, or not nominate any projects for an award (they
won't always be relevant). Awards will be granted if a majority of judges 
nominate the same award to a project. The award model has a flag `is_plurality` 
to allow for some awards to be granted to whichever project gets the most 
nominations, however this currently isn't in use.

In terms of edge cases (ties, no project getting a majority), we'll see how 
this hackathon goes, and update the project accordingly.

About
-----
Created as part of Coshx Hack2012.08

Technologies
------------

 - Core stack: Ruby on Rails
 - layout: ZURB Foundation
 - javascript: jquery
 - database: MongoDB
 - ORM: mongo_mapper

Team
----

 - Pitiya Le Huu - UX / wireframes (week before hackathon), and front-end static html and scss (first day of hackathon)
 - Edi Gil - UI / mock-ups (a few days before hackathon)
 - Ben Taitelbaum - back-end, javascript, css tweaks (during hackathon)

Future
------

 We want to keep working on this for future hackathons. We had to prioritize 
 the judging component for this version, but in the future, we want to allow
 participants to use this tool to form teams and see what's going on with other
 projects. Having a nice dashboard that shows commits and other updates would be
 exciting.

 This project was done in the manner of a prototype, so the javascript is starting 
 to get a little messy, especially with coordinating data between tabs. This is a 
 perfect use-case for a client-side MVC framework, so the next version will 
 need to use something like ember.
