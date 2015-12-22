import UIKit
import MapKit
import Foundation
import CoreLocation

class SecondViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    let bournemouthPier = CLLocationCoordinate2D(latitude: 50.716098, longitude: -1.875780)
    var userImage = "usericon4"
    

    @IBOutlet weak var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
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
        case 100..<200:
            userImage = "usericon6"
        case 200..<300:
            userImage = "usericon5"
        case 300..<400:
            userImage = "usericon4"
        case 400..<500:
            userImage = "usericon3"
        case 500..<600:
            userImage = "usericon2"
        case 600..<700:
            userImage = "usericon1"
        default:
            userImage = "usericon3"
        }
        
    }
    
}


extension SecondViewController: CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        
    }
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        
    }
    
}



class CustomPointAnnotation: MKAnnotationView {
    var imageName: String!
}

