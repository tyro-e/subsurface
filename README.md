#### Subsurface is a web application built upon the Grails framework that provides the user with three interactive stages with regards to concerts happening in Dublin. 

The stages I have dubbed as **‘Pre’** – where the concert is in the future; **‘Mid’** – when the concert is actually happening; and **‘Post’** whereby the concert has occurred, relative to the current date. There are various functions available at each stage.

**PRE** – this stage is concerned with finding a concert. On the homepage the next 50 concerts in Dublin are listed, the user also has the ability to search for specific artists to see if they are performing beyond these 50 gigs. Each concert has its own page where the user can see all relevant information such as address, date, venue and a link to buy a ticket. The user also has the ability to listen to music by the artist with a Spotify implementation included on the side.

Homepage above the fold:
![alt text](https://i.gyazo.com/96319b8eb38ea600e6bf2c96b5664d54.gif)

Homepage below the fold:
![alt text](homepage gif)

Login/ register pages:
![alt text](homepage gif)

The pre-event page:
![alt text](homepage gif)




**MID** – this stage involves livestreaming the concert from the event page and can only be performed by an admin.
![alt text](homepage gif)

Once a livestream has been initiated, an email is sent to all users of the site with the relevant details and a link.
![alt text](homepage gif)




**POST** – after the concert has happened, various functions become available to the user on the event page; such as rating the event, submitting a set list (what was performed) and uploading content.
![alt text](homepage gif)

There is an archive of all previous events which the user can browse and search through:
![alt text](homepage gif)



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
