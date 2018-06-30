//
//  AddOftenaddressViewController.swift
//  AllProject
//
//  Created by 劉彥廷 on 2018/6/28.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

class AddOftenaddressViewController: UIViewController{

    
    let city = ["台北市","新北市","桃園市","新北市","新竹市","苗栗縣","台中市","南投縣","彰化縣","雲林縣","嘉義縣","台南市","高雄市","屏東縣"]
    
    var addOftenAddressmyUserDefaults: UserDefaults!

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var locationArea: UITextField!
    @IBOutlet weak var lastAddress: UITextField!
    @IBOutlet weak var otherName: UITextField!

    @IBOutlet weak var cityPicker: UIPickerView!
    
    var chooseCity: String!
    var locationAreaText: String!
    var otherNameText: String!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        cityPicker.
        
        // about keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
        
   
    }

    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    

    
    // MARK: Keyboard Notifications
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardHeight = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
            scrollView.contentInset = UIEdgeInsetsMake(0, 0, keyboardHeight , 0)
            scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, keyboardHeight , 0)
            
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
        self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0)
    }
   /*
    @IBAction func addOftenAddressBtn(_ sender: Any) {
        
        //把資料傳到userDefault 值帶入上一頁
//        print("chooseCity is \(chooseCity)")

        
        guard locationArea.text != nil else {
          return  locationArea.text = ""
        }
        locationAreaText = locationArea.text
        
        guard otherName.text == nil else {
            return otherNameText = ""
        }
        otherNameText = otherName.text

        print("touch")
        let lastAddress = "\(chooseCity)\(locationAreaText)\(otherNameText)"
        print(lastAddress)
    }
    */
    
    @IBAction func sendBtn(_ sender: Any) {
        print("touch")
        print(locationArea.text)
        print(otherName.text)
        print(chooseCity)
    }
}


extension AddOftenaddressViewController: UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return city.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        chooseCity = city[row]
        print("chooseCity is \(chooseCity)")
        return city[row]
    }
    
}


/*
目前 touch btn no respond  原因是和 pickerview 衝突
 */
