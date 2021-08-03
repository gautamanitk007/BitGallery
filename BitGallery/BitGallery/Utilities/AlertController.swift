//
//  AlertController.swift
//  BitGallery
//
//  Created by Gautam Kumar Singh on 3/8/21.
//

import UIKit
extension UIViewController{
    func alert(title titleValue:String, message msg:String){
        let alert = UIAlertController(title:titleValue, message:msg, preferredStyle: UIAlertController.Style.alert)
        alert.modalPresentationStyle = .popover
        alert.addAction(UIAlertAction(title:"OK", style: .default) { _ in})
        present(alert, animated: true)
    }
}
