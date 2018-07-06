//
//  CallResultViewController.swift
//  AllProject
//
//  Created by 劉彥廷 on 2018/6/30.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

class CallResultViewController: UIViewController {

    @IBOutlet weak var carTeamNo: UILabel!
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
        vc.chooseState = .confirmInCar
        self.present(vc, animated: true, completion: nil)

/*  =====
         這個寫法和上面這個是一樣的
    =====
        let useStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = useStoryboard.instantiateViewController(withIdentifier: "CallCarAleareViewController") as! CallCarAleareViewController
        self.present(vc, animated: true, completion: nil)
*/
        

    }
    
    //接收到狀態改變 跳轉付款頁面
    @IBAction func arriveLocation(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CallCarPayMoneyViewController") as! CallCarPayMoneyViewController
//        vc.carTeamNo.text = carTeamNo.text
        vc.carTeamNoText = carTeamNo.text
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

/*
 
 這裡要用 clouser  來作用
 關鍵參考 (()->())?
 
 */
