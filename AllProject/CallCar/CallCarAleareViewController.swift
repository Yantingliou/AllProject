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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        self.dismiss(animated: true) {
           
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
