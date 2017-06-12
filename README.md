#### Subsurface is a web application built upon the Grails framework that provides the user with three interactive stages with regards to concerts happening in Dublin. 

The stages I have dubbed as **‘Pre’** – where the concert is in the future; **‘Mid’** – when the concert is actually happening; and **‘Post’** whereby the concert has occurred, relative to the current date. There are various functions available at each stage.

Homepage above the fold:
![alt text](https://i.gyazo.com/96319b8eb38ea600e6bf2c96b5664d54.gif)


**PRE** – this stage is concerned with finding a concert. 

This is the homepage below the fold, displaying a list of the next 50 concerts happening in Dublin, using the Bandsintown API. The background is a Google Maps display of Dublin which will change to the location of a concert if you click on one:
![alt text](http://i.imgur.com/blBZQKg.png)

A user can search for a gig beyond the 50 that are displayed on the homepage, you can also see how the map changes here:
![alt text](http://imgur.com/7WGagTi.png)

Clicking the INFO button from the homepage brings up the pre-event page for that concert, displaying all relevant information, along with a Spotify album artwork player on the right hand side, which will play the top track from that artists album when clicked:
![alt text](http://i.imgur.com/CWJFFAG.png)


**MID** – this stage involves livestreaming the concert from the event page and can only be performed by an admin. Below is a screenshot of the livestream being shown on my mobile, facing the source of the livestream - my laptops webcam.
![alt text](http://i.imgur.com/vGCnhKG.png)

Once a livestream has been initiated, an email is sent to all users of the site with the relevant details and a link. I used EmailJS for this, using an ajax call to gather all my users email addresses; my college email was the main sender address.
![alt text](http://i.imgur.com/VZTieUd.png)


**POST** – after the concert has happened, various functions become available to the user on the event page; such as rating the event - with an overall rating being made available, submitting a set list and uploading content (which is hosted on AWS S3).
![alt text](http://i.imgur.com/tYoF5h0.png)

There is an archive of all previous events, which the user can browse and search through:
![alt text](http://i.imgur.com/9pmOHBb.png)



Login + register pages with a very minimal design:
![alt text](http://i.imgur.com/skhEjj3.png)
![alt text](http://i.imgur.com/qiIHsQy.png)



**Tech:** 

• Grails 3.2.7

• Front end tech: HTML/ GSP, CSS, Bootstrap, Angular JS, JQuery, Slick JS, AJAX and Vanilla JS

• Bandsintown API

• Spotify API

• Google Maps API

• Amazon Web Services - S3

• REST (adding concerts from bandsintown to db)

• WebRTC (livestreaming)

• Socket.io (livestreaming)

• Heroku (livestreaming)

• GORM/ Hibernate

• MySQL

• EmailJS
