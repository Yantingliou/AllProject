//
//  CallCarPayMoneyViewController.swift
//  AllProject
//
//  Created by 劉彥廷 on 2018/6/30.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

class CallCarPayMoneyViewController: UIViewController {

    @IBOutlet weak var carTeamNo: UITextField!
    @IBOutlet weak var payMoney: UITextField!
    
    var carTeamNoText: String?
    var payMoneyText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carTeamNo.text = carTeamNoText
        payMoney.text = payMoneyText

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
