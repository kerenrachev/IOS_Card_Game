
import Foundation

import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {

    var locationManager: CLLocationManager!
    
    var currentLocation: CLLocation?
    
    // Just call setupLocationManager() in didFinishLaunchingWithOption.

        func setupLocationManager(){
                locationManager = CLLocationManager()
                locationManager?.delegate = self
                self.locationManager?.requestAlwaysAuthorization()
                locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locationManager?.startUpdatingLocation()

            }

        // Below method will provide you current location.
         func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

                if currentLocation == nil {
                    currentLocation = locations.last
                    locationManager?.stopMonitoringSignificantLocationChanges()
                    let locationValue:CLLocationCoordinate2D = manager.location!.coordinate

                    print("locations = \(locationValue)")

                    locationManager?.stopUpdatingLocation()
                }
            }

        // Below Mehtod will print error if not able to update location.
            func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
                print("Error")
            }
    
}
