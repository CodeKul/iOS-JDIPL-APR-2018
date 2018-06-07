//
//  ViewController.swift
//  MapViewDemo
//
//  Created by Varun on 24/05/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var myMapView : MKMapView!
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        myMapView.showsUserLocation = true
        myMapView.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self

        let annotation = MKPointAnnotation()
        annotation.coordinate.latitude = 18.509859
        annotation.coordinate.longitude = 73.833111
        
        annotation.subtitle = "Codekul"
        myMapView.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2))
        DispatchQueue.main.async {
            self.myMapView.setRegion(region, animated: true)
        }
    }
    
    func mapViewWillStartLocatingUser(_ mapView: MKMapView) {
        print("Locating Started")
    }
    
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        print("Loading started")
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("Loading finished")

    }
    
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        if fullyRendered {
            locationManager.startUpdatingLocation()
        }
    }
    
    func mapViewDidFailLoadingMap(_ mapView: MKMapView, withError error: Error) {
        
        print("Error loading")
    }
    
    func mapView(_ mapView: MKMapView, didFailToLocateUserWithError error: Error) {
        print("User nocation not updated")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

