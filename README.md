# Lab 6: Introduction to APIs - SoundCloud Player

## Due
Wednesday, April 11 at 11:59 PM

## Description
Two weeks before Spring Break, we covered some basics of networking in iOS. We will be using our
knowledge of RESTful APIs to stream songs from SoundCloud. 

You will find reviewing material from that lecture to be useful (3/12).

Our goal in this assignment will be to create an app that plays tracks from a
SoundCloud playlist. Additionally, this will serve as an exercise in working with APIs other than the Firebase API. By
the end of this lab, you should be able to play, pause, skip and rewind songs on the app.

## Instructions
**Create a SoundCloud Player App**

## Files
  * Track.swift - In the Model folder, this class will process a returned token from the SoundClouds API and verify that 
    it the content is streamable. You will be editing this file.
  * SoundCloudAPI.swift - Also in the Model folder, this class only has the 'loadTracks' function, which, as it gives away,
    loads tracks from SoundCloud and passes them to the Tracks class for processing.  You will also be editing this file.
  * PlayerViewController.swift - In the ViewControllers folder, this class is our ViewController which will update the UI 
    when a user plays the song, clicks next or makes any request to our API. You will not be editing this class.
  * The other files are just supporting files. The above three are the most important for this lab.

## TODO
  This is supposed to be a fast and easy lab so we can give you more time to work on your custom app and ask questions about it. If you try running the app right now, it will crash. To make it run, do the following 
  in the following classes:
 * Track.swift 
   * For this class, you will be processing the data that is returned by the API. As such, it is recommended that you start
      working with the API class first. As was covered in lecture, the data that is returned by the API is in JSON format, which
      is tructured as a Dictionary with Strings as keys and 'Any' as values. Your job is to get the song id, the name of the artist 
      and the title of the song. Refer to the instructions in the 'TODO' for the class. 
 * PlayerViewController.swift
   * This is where you will do the chunk of the work. In the loadTrack function, we have added a session, however, we have not 
      added any tast to the session. Your job is to add a dataTask to the session with the given url, which will make an api call
      to SoundCloud and return the data we need. Then you will process the returned data from the url. In processing the data, you 
      will create a an Array with objects of type 'Track', go through the returned data and get tracks (songs) that have been returned,
      initialize them as instances of the 'Track' class and append them to the Array you created earlier. Make sure you pass the values
      in your tracks Array to a completion before ending anything.

## Submission
  * To get credit for this lab, make sure you get checked by a TA before the deadline.
  
