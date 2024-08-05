Entities:

Users, Creators, Consumers, Youtube Channel, Youtube Statistics, Youtube Video, Video Type, Comment Section, Third-party Sponsor, Video Metadata, Comment

Relations:

The User entity has a one-to-one relationship with the Unique ID and Name entities.
The User entity has a one-to-many relationship with the Email, Age, and Address entities.
The User entity has a one-to-many relationship with the Video Creator and Video Consumer entities.
The Video Creator entity has a one-to-many relationship with the YouTube Channel entity.
The YouTube Channel entity has a one-to-one relationship with the Name, Owner, Subscription Count, and Creation Details entities.
The Video Consumer entity has a many-to-many relationship with the YouTube Channel entity.
The Subscription entity has a one-to-one relationship with the Subscription Type entity.
The YouTube Video entity has a one-to-one relationship with the URL, Title, Thumbnails, Category, Duration, Description, Uploader ID, Upload Date, and Upload Time entities.
The YouTube Video entity has a one-to-many relationship with the Informational Video and Entertainment Video entities.
The Informational Video entity has a one-to-many relationship with the Keywords entity.
The Entertainment Video entity has a one-to-many relationship with the Tags entity.
The YouTube Video entity has a one-to-one relationship with the YouTube Statistics entity.
The YouTube Statistics entity has a one-to-many relationship with the Likes, Dislikes, View Count, Number of Shares, and Number of Comments entities.
The YouTube Video entity has a one-to-many relationship with the Comments Section entity.
The Comment entity has a one-to-many relationship with the Comment Text, Likes, Sentiment, and Comment Details entities.
The YouTube Video entity has a one-to-many relationship with the Third-Party Sponsor entity.
The Third-Party Sponsor entity has a one-to-one relationship with the Sponsor ID, Name, Phone, and Amount Sponsored entities.

Public keys:

User ID (in the User entity)
Unique ID (in the Unique ID entity)
Video Creator ID (in the Video Creator entity)
Video Consumer ID (in the Video Consumer entity)
Channel ID (in the YouTube Channel entity)
Video ID (in the YouTube Video entity)
Informational Video ID (in the Informational Video entity)
Entertainment Video ID (in the Entertainment Video entity)
Statistics ID (in the YouTube Statistics entity)
Comments Section ID (in the Comments Section entity)
Comment ID (in the Comment entity)
Third-Party Sponsor ID (in the Third-Party Sponsor entity)

Foreign keys:

User ID (in the Email, Age, Address, Video Creator, and Video Consumer entities)
Video Creator ID (in the YouTube Channel entity)
Video Consumer ID (in the Subscription entity)
Channel ID (in the Subscription entity)
Video ID (in the URL, Title, Thumbnails, Category, Duration, Description, Uploader ID, Upload Date, Upload Time, Informational Video, Entertainment Video, YouTube Statistics, Comments Section, and Third-Party Sponsor entities)
Informational Video ID (in the Keywords entity)
Entertainment Video ID (in the Tags entity)
Statistics ID (in the Likes, Dislikes, View Count, Number of Shares, and Number of Comments entities)
Comments Section ID (in the Comment entity)
Comment ID (in the Comment Text, Likes, Sentiment, and Comment Details entities)
Third-Party Sponsor ID (in the Sponsor ID, Name, Phone, and Amount Sponsored entities)