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
import CoreMotion

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var theMap: MKMapView!
    
    var manager:CLLocationManager!
    var pedometer:CMPedometer!
    var initialLocation:CLLocation!
    var stepsNeeded = 15
    
    
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

        pedometer = CMPedometer()
        
        loadEnemyRegions()
    }

    func loadEnemyRegions() {
        for (index, region) in enumerate(World.enemyRegions) {
            var circle = MKCircle(centerCoordinate: region.location.coordinate, radius: region.radius)
            theMap.addOverlay(circle)
            registerRegionFromOverlay(circle, identifier: "enemy \(index)")
        }
    }

    func registerRegionFromOverlay(overlay: MKCircle, identifier: NSString) {
        // If the overlay's radius is too large, registration fails automatically,
        // so clamp the radius to the max value.
        var radius = overlay.radius;
        if (radius > manager.maximumRegionMonitoringDistance) {
            radius = manager.maximumRegionMonitoringDistance;
        }

        // Create the geographic region to be monitored.
        var geoRegion = CLCircularRegion(circularRegionWithCenter: overlay.coordinate, radius: radius, identifier: identifier)
        manager.startMonitoringForRegion(geoRegion)
    }

    func locationManager(manager: CLLocationManager!, didEnterRegion region: CLRegion!) {
        pedometer.startPedometerUpdatesFromDate(NSDate(),
                                                withHandler: { data, error in
                                                    NSLog("took \(data.numberOfSteps.integerValue) steps")
                                                    if(data.numberOfSteps.integerValue >= self.stepsNeeded) {
                                                        self.checkForMonster()
                                                    }
                                                }
        )

    }

    func checkForMonster(){
        let diceRoll = Int(arc4random_uniform(7))
        NSLog("rolling die: \(diceRoll)")
        if (diceRoll >= 5) {
            NSLog("triggering monster")
            self.pedometer.stopPedometerUpdates()
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

