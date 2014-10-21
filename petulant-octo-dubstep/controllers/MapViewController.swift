//
//  MapViewController.swift
//  petulant-octo-dubstep
//
//  Created by Ken Shimizu on 10/21/14.
//  Copyright (c) 2014 viceversus. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var theMap: MKMapView!
    
    var manager:CLLocationManager!
    var initialLocation:CLLocation!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
        theMap.delegate = self
        theMap.mapType = MKMapType.Standard
        theMap.showsUserLocation = true
        
        loadEnemyRegions()
    }

    func loadEnemyRegions() {
        for region in World.enemyRegions {
            var circle = MKCircle(centerCoordinate: region.location.coordinate, radius: region.radius)
            theMap.addOverlay(circle)
        }
    }

    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        if overlay is MKCircle {
            var circle = MKCircleRenderer(overlay: overlay)
            circle.strokeColor = UIColor.redColor()
            circle.fillColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.1)
            circle.lineWidth = 1
            return circle
        } else {
            return nil
        }
    }

    func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!) {
        if ( initialLocation == nil ) {
            self.initialLocation = userLocation.location;
            var span = MKCoordinateSpan(latitudeDelta: 0.02 as CLLocationDegrees, longitudeDelta: 0.02 as CLLocationDegrees)
            var mapRegion = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: span)
            mapView.setRegion(mapRegion, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

