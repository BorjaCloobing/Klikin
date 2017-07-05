//
//  ProgressBR.swift
//  Cloobing
//
//  Created by Borja Rodriguez Sánchez on 27/11/15.
//  Copyright (c) 2015 Borja Rodriguez Sánchez. All rights reserved.
//

import UIKit

class ProgressBR: UIVisualEffectView {

    var text: String? {
        didSet {
            label.text = text
        }
    }
    let activityIndictor: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
    let label: UILabel = UILabel()
    let blurEffect = UIBlurEffect(style: .light )
    let vibrancyView: UIVisualEffectView
    
    init(text: String) {
        self.text = text
        self.vibrancyView = UIVisualEffectView(effect: blurEffect)
        super.init(effect: blurEffect)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.text = ""
        self.vibrancyView = UIVisualEffectView(effect: blurEffect)
        super.init(coder: aDecoder)
        self.setup()
        
    }
    
    func setup() {
        contentView.addSubview(vibrancyView)
        vibrancyView.contentView.addSubview(activityIndictor)
        vibrancyView.contentView.addSubview(label)
        activityIndictor.startAnimating()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if let superview = self.superview {
            
            let width = superview.frame.size.width / 1.3
            let height: CGFloat = 50.0
            self.frame = CGRect(x: superview.frame.size.width / 2 - width / 2,
                y: superview.frame.height / 2 - height / 2,
                width: width,
                height: height)
           
            vibrancyView.frame = self.bounds
            vibrancyView.backgroundColor = UIColor.white
            vibrancyView.alpha = 0.8
            let activityIndicatorSize: CGFloat = 40
            activityIndictor.frame = CGRect(x: 5, y: height / 2 - activityIndicatorSize / 2, width: activityIndicatorSize, height: activityIndicatorSize)
            
            layer.cornerRadius = 8.0
            layer.masksToBounds = true
            label.text = text
            label.textAlignment = NSTextAlignment.center
            label.frame = CGRect(x: activityIndicatorSize + 5,y: 0,width: width - activityIndicatorSize - 15,height: height)
            label.textColor = UIColor.black
            label.font = UIFont.boldSystemFont(ofSize: 16)
            
        }
    }
    
    func show() {
        self.isHidden = false
    }
    
    func hide() {
        self.isHidden = true
    }
}
