//
//  MapViewController.swift
//  Air Quality
//
//  Created by Максим Юрисов on 09.11.2022.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

var ppmLevel: Int = 0

class MapViewController: BaseController{
    let mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        title = "Map"
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("reload map")
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mapView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        mapView.removeAnnotations(mapView.annotations)
       
        for char in characters{
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(char.name) { addreses, error in
                //преобразовываем название города в координаты
                guard let address = addreses?[0] else {return}
                let coordinate:CLLocationCoordinate2D = address.location!.coordinate
                //делаем аннотацию
                let annotation = MKPointAnnotation();
                annotation.coordinate = coordinate
                ppmLevel = char.value
                annotation.title = char.name+" "+String(char.value)
                self.mapView.addAnnotation(annotation)
            }
            
        }
    }
    
    
}


extension MapViewController: MKMapViewDelegate{
 
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
        
        pin.pinTintColor = returncolor(ppmLevel: ppmLevel)
        pin.canShowCallout = true
        return pin
    }
}
