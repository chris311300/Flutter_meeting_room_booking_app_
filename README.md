Flutter Application. Solution to SSG Technical test

-   User Story Completed.

-   Compiles and runs in one step.

Technologies Used:

-   Flutter SDK / Dart

IDE Used:

-   Android Studio

Packages Used:

-   animated_text_kit: ^4.1.1

-   http: ^0.13.1

-   curved_navigation_bar: ^0.3.7

Technical Questions:

1.  What would you add to your solution if you had more time?

-If I had more time I would try and abstract and encapsulate the code more. I'd follow    whatever state management rules the company uses to manage the state better and it would also increase the performance of the app. I'd try to add features that would enhance the user experience such as search filters, a chat system, fetching directions to locations, Live status if a room is occupied or not and if possible, a form to fill right before the booking is done, incase the client wants the room to be setup in any way prior to the meeting.

2.  What steps would you take to ensure the display of text, buttons etc remain consistant as the project grows and more team members join the team?

-I would take my time to learn more about QA and testing, try to automate testing, rather than hiring manual software testers to save costs for the company, although some manual testing would still be required. I'll be honest, I have very limited experience with automated testing as I have never had the need in the past and I'd test it manually. But when it comes to different screen sizes, I'd add queries, similar to web dev, where the app scales as per the screen size. The solution to the technical interview isn't optimized for tablet screens yet due to the time constraint, but should work perfectly fine on all mobile screens.

3.  How would you track down a performance issue in production? Have you ever had to do this?

- I would firstly check resource usage. I.e. Battery, ram usage. If possible, I would try to optimize everything as much as possible. Some examples would be compressing images to a slight extent and turning down the location accuracy if location was required and also try to minify the code as much as possible. Yes I had to do it once, when I was working on an App that required location permissions, but ended up nothing being able to do much as the app required the location to be at its highest accuracy.
