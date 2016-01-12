
import UIKit
import MapKit
import Foundation
import CoreLocation

class SecondViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    let bournemouthPier = CLLocationCoordinate2D(latitude: 50.716098, longitude: -1.875780)
    var userImage = "usericon4"
    var showingAlert = false
    var refreshAlert: UIAlertController?
    
    //Make sure to set the app to run on iPhone 5 and the simulation is set to "Location" if it's not already set.

    @IBOutlet weak var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        myMap.setUserTrackingMode(.Follow, animated: true)
        myMap.delegate = self
        
        let bournemouthPierRegion = CLCircularRegion(center: bournemouthPier, radius: 100, identifier: "bournemouthPier")
        locationManager.startMonitoringForRegion(bournemouthPierRegion)
        
        
    }
    
}

extension SecondViewController: MKMapViewDelegate {
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation.isEqual(mapView.userLocation) {
            
            let identifier = "User"
            
            var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
        
            if annotationView == nil{
                annotationView = CustomPointAnnotation(annotation: annotation, reuseIdentifier: identifier)
                annotationView!.canShowCallout = true
                
            } else {
                annotationView!.annotation = annotation
            }
            
            annotationView!.image = UIImage(named: userImage)
            
            return annotationView

        }
        return nil
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        let userCoord = CLLocation(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        
        let distance = userCoord.distanceFromLocation(CLLocation(latitude: bournemouthPier.latitude, longitude: bournemouthPier.longitude))
        print(distance)
        
        switch distance {
        case 0..<100:
            userImage = "usericon7"
        case 100..<300:
            userImage = "usericon6"
        case 300..<500:
            userImage = "usericon5"
        case 500..<700:
            userImage = "usericon4"
        case 700..<900:
            userImage = "usericon3"
        case 900..<1100:
            userImage = "usericon2"
        case 1100..<5000:
            userImage = "usericon1"
        default:
            userImage = "usericon3"
        }
        
    }
    
}


extension SecondViewController: CLLocationManagerDelegate {
        
        
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation = locations.last
        
        if let newLocation = newLocation {
            print(newLocation)
        }
        
    }
    
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Entering \(region.identifier)")
        
        if !showingAlert {
            showingAlert = true
            refreshAlert = UIAlertController(title: "GeoCache Found", message: "You are in the vicinity of a Geocache", preferredStyle: UIAlertControllerStyle.Alert)
            
            
            refreshAlert!.addAction(UIAlertAction(title: "Grab Cache", style: .Default, handler: { _ in
                self.performSegueWithIdentifier("geocache", sender: self)
            }))
            
            presentViewController(refreshAlert!, animated: true, completion: nil)
        }
    }
    
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        
        if let refreshAlert = refreshAlert {
            refreshAlert.dismissViewControllerAnimated(true, completion: { _ in
                self.showingAlert = false
            })
        }
        
    }
    
}



class CustomPointAnnotation: MKAnnotationView {
    var imageName: String!
    }

