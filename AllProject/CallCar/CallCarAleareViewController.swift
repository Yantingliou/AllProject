//
//  CallCarAleareViewController.swift
//  AllProject
//
//  Created by 劉彥廷 on 2018/6/30.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

class CallCarAleareViewController: UIViewController {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var describe: UILabel!
    
    enum state {
        case confirmInCar
        case cancelCall
    }
    
    var chooseState: state = .confirmInCar
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switch chooseState {
        case .cancelCall:
            titleLable.text = "上車確認"
            describe.text = "是否已經搭上計程車"
        case.confirmInCar:
            titleLable.text = "取消叫車"
            describe.text = "確定將取消叫車嗎？"
        default:
            break
        }
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func confirmBtn(_ sender: Any) {
        /*
         這裡會有兩種情況，
         一種是人上車
         一種是取消叫車
         */
        
      
        switch chooseState {
        case .cancelCall:
            self.dismiss(animated: true) {
                
            }
        case .confirmInCar:
            self.dismiss(animated: true) {
                
            }
        default:
            break
        }
       
    }
    

    @IBAction func cancelBtn(_ sender: Any) {
        /*
         這裡會有兩種情況，
         一種是人上車
         一種是取消叫車
         */
    }
}
