//
//  CallResultViewController.swift
//  AllProject
//
//  Created by 劉彥廷 on 2018/6/30.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

class CallResultViewController: UIViewController {

    @IBOutlet var backgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func cancelBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CallCarAleareViewController") as! CallCarAleareViewController
        self.present(vc, animated: true, completion: nil)

/*  =====
         這個寫法和上面這個是一樣的
    =====
        let useStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = useStoryboard.instantiateViewController(withIdentifier: "CallCarAleareViewController") as! CallCarAleareViewController
        self.present(vc, animated: true, completion: nil)
*/
        
/*
        let modelVC = self.storyboard?.instantiateViewController(withIdentifier: "CallCarAleareViewController") as! CallCarAleareViewController
        let navBarOnModal: UINavigationController = UINavigationController(rootViewController: modelVC)

        self.present(navBarOnModal, animated: true, completion: nil)
 */
    }
    
}

/*
 
 這裡要用 clouser  來作用
 關鍵參考 (()->())?
 
 */
