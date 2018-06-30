//
//  UIViewExension.swift
//  AllProject
//
//  Created by 劉彥廷 on 2018/6/30.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

extension UIView{
    
    func setBorder(width: CGFloat, radius: CGFloat, color: UIColor?){
        self.layer.cornerRadius = radius
        self.layer.borderWidth  = width
        
        if let borderColor = color{
            self.layer.borderColor  = borderColor.cgColor
        }
    }
    
}
