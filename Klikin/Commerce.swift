//
//  Commerce.swift
//  Klikin
//
//  Created by Borja Rodriguez Sánchez on 4/7/17.
//  Copyright © 2017 Borja Rodriguez Sánchez. All rights reserved.
//

import UIKit

class Commerce: NSObject {
    
    var id = String()
    var zip = Int()
    var city = String()
    var country = String()
    var address = String()
    var phone = String()
    var email = String()
    var web = String()
    var name  = String()
    var openingHours = String()
    var category = String()
    var descriptionCommerce = String()
    var shortDescription = String()
    var facebook = String()
    var logoURL = String()
    var photoURL = String()
    var lat = Float()
    var long = Float()
    
    
    
    init(id : String, zip: Int,city : String, country : String, address: String, phone: String,email: String,web: String,name: String,openingHours: String,category: String,descriptionCommerce: String,shortDescription: String,facebook: String,logoURL: String,photoURL: String, lat: Float, long: Float) {
        self.id = id
        self.zip = zip
        self.city = city
        self.country = country
        self.address = address
        self.phone = phone
        self.email = email
        self.web = web
        self.name = name
        self.openingHours = openingHours
        self.category = category
        self.descriptionCommerce = descriptionCommerce
        self.shortDescription = shortDescription
        self.facebook = facebook
        self.logoURL = logoURL
        self.photoURL = photoURL
        self.lat = lat
        self.long = long
    }

}

var commerceArray = [Commerce]()
