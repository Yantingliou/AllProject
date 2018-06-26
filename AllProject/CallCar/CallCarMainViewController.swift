//
//  CallCarMainViewController.swift
//  AllProject
//
//  Created by 劉彥廷 on 2018/6/26.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

class CallCarMainViewController: UIViewController {

    @IBOutlet weak var location: UITextField!
    
    @IBOutlet weak var aliasLocationName: UILabel!
    @IBOutlet weak var oftenUseLocationName: UILabel!
    @IBOutlet weak var oftenLocationViewHeigth: NSLayoutConstraint!
    
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var wheelChair: UIImageView!
    @IBOutlet weak var largeLuggag: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   //摸螢幕縮鍵盤
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.backgroundView.endEditing(true)
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
