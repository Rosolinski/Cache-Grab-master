# Cache Grab

Cache Grab is currently a functional prototype of a geocache tracking iOS app, consisting of the code and files featured in this repository. This readme will guide you through how to use this prototype. The geocache is hidden on a GPS map and the user has to navigate the map to find it. The user will be able to know if they are getting closer or further away from the geocache, depending on the colour of their user icon. The icon turns red if they are getting closer, and if the icon turns blue, it means they aregetting further away from the geocache. 

This app is intended to run on iPhone 5.

### ViewController - Home/menu screen

This screen introduces the user to Cache Grab after they see a splash screen with the official logo. The user can then tap  one of the two buttons “Start Searching” and “View Grabbed Caches”, with each button linking to a separate ViewController.

### SecondViewController - MapView

This is the ViewController that required the most code, as it was one of the most important screens for the project. Without the MapView, Cache Grab wouldn’t be successful as a geocache tracking app.

Initially, the hand icon representing the user would change colour automatically, depending on their distance from the geocache. This however, wasn’t completely realised as in the end, I wasn’t able to get the icon to change automatically. The user can change the colour of the icon by moving to somewhere on the map, pressing the “back” button on the top left and then press “start searching” again. This refreshes the map and changes the colour of the user icon accordingly, so the code is functional to a degree.

I used switch code to change the colour of icon. For example:

        switch distance {
        
        case 0..<100:
        
            userImage = "usericon7"
            
        case 100..<300:
        
            userImage = "usericon6"
            
        case 300..<500:
        
            userImage = "usericon5"

This code allows the user icon to be replaced by a different icon every 100-200 metres the user is away from the geocache. When the user is within 100 metres of the geocache, their icon should change to "usericon7" and they will receive a notification that will take them to the FifthViewController.

Note: if for some reason, the icon isn't moving by itself, be sure to set the simulated location to "location".

### ThirdViewController - Caches screen

The main purpose for this ViewController is not yet fully realised. At the moment, it serves as a prototype view for the screen that users will access when they want to look at geocaches they have previously found. The functionality of this ViewController will be expanded upon in the future.

### FourthViewController - Help screen

The sole function for this ViewController is to inform users about how to use the app (the SecondViewController in particular). I designed this screen after realising that it might look less professional and aesthetically pleasing to include all this information on the MapView.

### FifthViewController - Notification screen

This screen appears once the user has located the geocache and has tapped the “Grab Cache” button. The user can then tap on the geocache icon to see the media it contains. The “back” button has been hidden from this point onwards to make navigation in the following screens smoother and easier for the user.

        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton

### SixthViewController - Geocached media

This ViewController was also important to my app as the main point of using Cache Grab and navigating the map is to access this media.  This media is interactive, as the user can tap on the three featured images to view them full-size. There is also a story by the geocache author posted under the images. The user can scroll through this story to read it. After the user has finished interacting with the geocache contents, they can tap the “Back to menu” button to return to the first ViewController.

### SeventhViewController, EighthViewController & NinthViewController - Fullscreen images

These View Controllers have been used to fully display the images featured on the SixthViewController. Tapping on the fullscreen images sends the user back to the previous ViewController.

