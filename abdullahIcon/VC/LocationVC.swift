//
//  LocationVC.swift
//  abdullahIcon
//
//  Created by abdullah  on 29/05/1441 AH.
//  Copyright © 1441 abdullah . All rights reserved.
//

import UIKit
import MapKit



class LocationVC : UIViewController , MKMapViewDelegate {
    
    @IBOutlet weak var MapView: MKMapView!
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let anno = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnoView") ?? MKAnnotationView()
        return anno
    }
    
    
    
    @IBAction func BackButton(_ sender: Any) {

          self.dismiss(animated: true, completion: nil)
          
      }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        XLocation.Shared.GetMyLocation()
        XLocation.Shared.GotLocation = {
            print(XLocation.Shared.Longtude)
            print(XLocation.Shared.Latitude)
            
            let coordinate = CLLocationCoordinate2D(latitude: XLocation.Shared.Latitude, longitude: XLocation.Shared.Longtude)
            
            let newPlace = Place(coordinate: coordinate, title: "موقعك الحالي", subtitle: "في هذه اللحظة")
            
            self.MapView.addAnnotation(newPlace)
            
            
        }
    }

}


class Place : NSObject , MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D , title: String? , subtitle: String? ) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
    
    
}


