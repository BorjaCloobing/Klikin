//
//  ViewController.swift
//  Klikin
//
//  Created by Borja Rodriguez Sánchez on 4/7/17.
//  Copyright © 2017 Borja Rodriguez Sánchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLConnectionDataDelegate {
    
    var overlayView = UIView()
    let progressHUD = ProgressBR(text: "Searching commerce")
    private var responseData:NSMutableData?
    private var connection:NSURLConnection?
    var api = API()
    
    @IBOutlet weak var findButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        let titleImageView = UIImageView(image: UIImage(named: "logoKlikin.png"))
        titleImageView.frame = CGRect(x: 0, y: 0,width: titleView.frame.width,height: titleView.frame.height)
        titleView.addSubview(titleImageView)
        self.navigationItem.titleView = titleView
        
        
        customButton(x: findButton)
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// Description
    /// Función del botón buscar, hace la llamada a la API de búsqueda de comercios, primero comprueba que tenemos acceso a internet, sino mostrará un mensaje indicando el error "multiidioma" las llamadas a la api están en asynch para poder utilizar los hilos y activar y desactivar los custom spinner y overlay cuando termine el proceso
    /// - Parameter sender: "any"
    
    @IBAction func findCommerceButton(_ sender: Any) {
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
            overlayView = UIView(frame: UIScreen.main.bounds)
            overlayView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            //overlayView.addSubview(progressHUD)
            self.view.addSubview(overlayView)
            self.view.addSubview(progressHUD)
            progressHUD.show()
            self.view.isUserInteractionEnabled = false
            
            DispatchQueue.main.async(execute: { () -> Void in
                sleep(2)
                self.api.findCommerce()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.overlayView.backgroundColor = UIColor.clear
                    self.overlayView.removeFromSuperview()
                    self.progressHUD.hide()
                    self.performSegue(withIdentifier: "search", sender: nil)
                    self.view.isUserInteractionEnabled = true

                }
                
            })
        }else{
            print("Internet connection FAILED")
            let alert = UIAlertController(title: NSLocalizedString("Alert Title", comment: "The alert title"), message: NSLocalizedString("Alert message", comment: "Explain the alert message"), preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    
    /// Custom fuction to make button rounded
    ///
    /// - Parameter x: UIButton
    func customButton(x : UIButton){
        findButton.layer.borderWidth=1.0
        findButton.layer.borderColor = UIColor.white.cgColor
        findButton.layer.cornerRadius = findButton.frame.size.height/2
        findButton.clipsToBounds = true
    }
    
}

