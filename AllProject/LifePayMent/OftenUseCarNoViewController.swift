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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
