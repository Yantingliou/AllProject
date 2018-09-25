//
//  OftenUseCarNoViewController.swift
//  AllProject
//
//  Created by 劉彥廷 on 2018/7/12.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

class OftenUseCarNoViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func leftBtn(_ sender: Any) {
     print("next Page")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CarNoInformationViewController") as! CarNoInformationViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
    @IBAction func addCarNoBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LifePayMentMainViewController") as! LifePayMentMainViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
