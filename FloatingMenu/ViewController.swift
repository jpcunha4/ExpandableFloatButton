//
//  ViewController.swift
//  FloatingMenu
//
//  Created by Joao Paulo Cunha Ávila on 20/02/20.
//  Copyright © 2020 Joao Paulo Cunha Ávila. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var floatingView: UIView!
    var arrowImageView: UIImageView!
    var isRetracted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addFloatingView()
    }
    
    func addFloatingView() {
        
        floatingView = UIView()
        
        let width = getScreenSize().width
        let height = getScreenSize().height
        
        floatingView.frame = CGRect(x: width * 0.65, y: height * 0.8, width: width * 0.8, height: 70)
        floatingView.layer.cornerRadius = 20
        floatingView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        floatingView.layer.borderWidth = 3
        floatingView.layer.borderColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onPress))
        floatingView.addGestureRecognizer(gesture)
        self.view.addSubview(floatingView)
        
        let staticLabel = UILabel(frame: CGRect(x: floatingView.frame.width * 0.1, y: floatingView.frame.height * 0.2, width: 100, height: 45))
        staticLabel.text = "Valor\ndo dolar"
        staticLabel.numberOfLines = 0
        staticLabel.textAlignment = .center
        staticLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        floatingView.addSubview(staticLabel)
        
        arrowImageView = UIImageView(image: #imageLiteral(resourceName: "back"))
        arrowImageView.frame = CGRect(x: floatingView.frame.width * 0.06, y: floatingView.frame.height * 0.4, width: 10, height: 15)
        arrowImageView.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        floatingView.addSubview(arrowImageView)
        
        isRetracted = true
        
        let dollarLabel = UILabel(frame: CGRect(x: floatingView.frame.width * 0.45, y: floatingView.frame.height * 0.2, width: 100, height: 45))
        dollarLabel.attributedText = NSAttributedString(string: "R$1,7777", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)])
        dollarLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        floatingView.addSubview(dollarLabel)
    }
    
    func getScreenSize() -> CGRect {
        return UIScreen.main.bounds
    }
    
    @objc func onPress() {
        let width = getScreenSize().width
        let height = getScreenSize().height
        
        UIView.animate(withDuration: 0.8, animations: {
            let frame = self.floatingView.frame
            if self.isRetracted {
                self.floatingView.frame = CGRect(x: width * 0.35, y: height * 0.8, width: frame.width, height: frame.height)
            } else {
                self.floatingView.frame = CGRect(x: width * 0.65, y: height * 0.8, width: frame.width, height: frame.height)
            }
            
            self.isRetracted = !self.isRetracted
            
            UIView.transition(with: self.arrowImageView, duration: 0.1, options: .transitionFlipFromLeft, animations: {
                self.arrowImageView.image = self.isRetracted ? #imageLiteral(resourceName: "back") : #imageLiteral(resourceName: "next")
            }, completion: nil)
        })
    }
    
    
}

