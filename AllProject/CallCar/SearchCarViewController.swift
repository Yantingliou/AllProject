//
//  SearchCarViewController.swift
//  AllProject
//
//  Created by 劉彥廷 on 2018/6/26.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

class SearchCarViewController: UIViewController {

    @IBOutlet weak var addressLable: UILabel!
    
    var address: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addressLable.text = address
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancalCallCarBtn(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CallCarAleareViewController") as! CallCarAleareViewController
        vc.chooseState = .cancelCall
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func carArrive(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CallResultViewController") as! CallResultViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
   

}
