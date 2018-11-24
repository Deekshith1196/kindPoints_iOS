//
//  Utils.swift
//  kindPoints
//
//  Created by Deekshith Maram on 10/24/18.
//  Copyright © 2018 Deekshith Maram. All rights reserved.
//

import Foundation
import UIKit


func viewShadow(view: UIView){
    view.layer.shadowColor = UIColor.gray.cgColor
    view.layer.shadowOpacity = 0.3
    view.layer.shadowOffset = CGSize.zero
    view.layer.shadowRadius = 6
}
