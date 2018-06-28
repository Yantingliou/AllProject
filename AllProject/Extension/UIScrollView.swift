//
//  UIScrollView.swift
//  AllProject
//
//  Created by 劉彥廷 on 2018/6/28.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

extension UIScrollView {
 
        override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.next?.touchesBegan(touches, with: event)
            print("touchesBegan")
        }
        
        override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.next?.touchesMoved(touches, with: event)
            print("touchesMoved")
        }
        
        override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.next?.touchesEnded(touches, with: event)
            print("touchesEnded")
        }
    
}

/* scrollerview  和 touch event 衝突
 解決網址
 https://stackoverflow.com/questions/29799529/subclass-uiscrollview-in-swift-for-touches-began-touches-moved
 第二個網址
 https://blog.csdn.net/hbblzjy/article/details/51994707
 */

