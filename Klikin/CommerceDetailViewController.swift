//
//  CommerceDetailViewController.swift
//  Klikin
//
//  Created by Borja Rodriguez Sánchez on 5/7/17.
//  Copyright © 2017 Borja Rodriguez Sánchez. All rights reserved.
//

import UIKit
import MapKit

class CommerceDetailViewController: UIViewController {

    @IBOutlet weak var commerceGallery: UIImageView!
    @IBOutlet weak var commerceName: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var openingLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    var commerce : Commerce!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCommerceView()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configCommerceView(){
        commerceName.text = commerce.name
        commerceGallery.hnk_setImageFromURL(NSURL(string:commerce.photoURL)! as URL)
        phoneLabel.text = commerce.phone
        addressLabel.text = commerce.city
        openingLabel.text = commerce.openingHours
        infoLabel.text = commerce.shortDescription
        descriptionLabel.text = commerce.descriptionCommerce
        mapSetting()
        
    }
    
    func mapSetting(){
        print(commerce.lat)
        print(commerce.long)
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(CLLocationDegrees(commerce.long), CLLocationDegrees(commerce.lat))
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = commerce.name
        annotation.subtitle = commerce.city
        map.addAnnotation(annotation)
    }

}
