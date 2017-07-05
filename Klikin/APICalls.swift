//
//  APICalls.swift
//  Klikin
//
//  Created by Borja Rodriguez Sánchez on 4/7/17.
//  Copyright © 2017 Borja Rodriguez Sánchez. All rights reserved.
//

import Foundation

class API: NSObject{
    
    var apiURL:String = "https://s3-eu-west-1.amazonaws.com/developers-tests/"
    
    /// Saco a una variable genérica la ruta sin el archivo, para poder hacer comprobaciones en dev/pre/prod sin tener que cambiarlo en sucesivas llamadas a la API.
    func findCommerce() ->Void{
        let urlString = apiURL + "commerces.json"
        let urli = URL(string: urlString)
        URLSession.shared.dataTask(with:urli!) { (data, response, error) in
            if error != nil {
                print(error!)
            } else {
                do {
                    
                    let parsedData = try JSONSerialization.jsonObject(with: data!) as! NSArray
                    let json = JSON(parsedData)
                    if let jsonArray = json.array
                    {
                        //it is an array, each array contains a dictionary
                        for item in jsonArray
                        {
                            if let jsonDict = item.dictionary //jsonDict : [String : JSON]?
                            {
                                //loop through all objects in this jsonDictionary
                                let id = jsonDict["_id"]!.stringValue
                                let zip = jsonDict["address"]?["zip"].intValue
                                let city = jsonDict["address"]?["city"].stringValue
                                let country = jsonDict["address"]?["country"].stringValue
                                let address = jsonDict["address"]?["street"].stringValue
                                let phone = jsonDict["contact"]?["phone"].stringValue
                                let email = jsonDict["contact"]?["email"].stringValue
                                let web = jsonDict["contact"]?["web"].stringValue
                                let name = jsonDict["name"]!.stringValue
                                var openingHours = jsonDict["openingHours"]?.stringValue
                                if openingHours == nil{
                                    openingHours = ""
                                }
                                let category = jsonDict["category"]!.stringValue
                                var descriptionCommerce = jsonDict["description"]?.stringValue
                                if descriptionCommerce == nil{
                                    descriptionCommerce = ""
                                }
                                var shortDescription = jsonDict["shortDescription"]?.stringValue
                                if shortDescription == nil{
                                    shortDescription = ""
                                }
                                var facebook = jsonDict["social"]?["facebook"].stringValue
                                if facebook == nil{
                                    facebook = ""
                                }
                                let logoURL = jsonDict["logo"]?["thumbnails"]["small"].stringValue
                                print(logoURL!)
                                
                                //Para este ejemplo voy a coger solo la primera foto, en caso de no tener le pongo una de placeholder.
                                var photoURL = jsonDict["photos"]?[0]["url"].stringValue
                                print(photoURL!)
                                if photoURL == ""{
                                    photoURL = "https://www.reasonwhy.es/sites/default/files/styles/noticia_principal/public/klikin-comercio-local-reasonwhy.es_.png?itok=WNg7LrItg"
                                }
                                let lat = jsonDict["location"]?[0].floatValue
                                let long = jsonDict["location"]?[1].floatValue
                                print(logoURL!)
                                //...etc. ...create post object..etc.
                                let commerce = Commerce(id: id, zip: zip!, city: city!, country: country!, address: address!, phone: phone!, email: email!, web: web!, name: name, openingHours: openingHours!, category: category, descriptionCommerce: descriptionCommerce!, shortDescription: shortDescription!, facebook: facebook!, logoURL: logoURL!, photoURL: photoURL!,lat: lat!, long:long!)
                                commerceArray.append(commerce)
                            }
                        }
                    }
                    
                } catch let error as NSError {
                    print(error)
                }
            }
            
            }.resume()
        
    }
    
    
}
