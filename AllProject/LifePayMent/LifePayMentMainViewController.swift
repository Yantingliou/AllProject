//
//  LifePayMentMainViewController.swift
//  AllProject
//
//  Created by 劉彥廷 on 2018/7/11.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

class LifePayMentMainViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var cityPick: UIPickerView!
    @IBOutlet weak var trafficKind: UIPickerView!
    @IBOutlet weak var trafficNo: UITextField!
    
    @IBOutlet weak var addCarNoBtn: UIImageView!
    
    let cityPickerData = ["台北市","新北市","桃園市","新北市","新竹市","苗栗縣","台中市","南投縣","彰化縣","雲林縣","嘉義縣","台南市","高雄市","屏東縣"]
    let trafficPickerData = ["汽車","機車"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityPick.tag = 0
        trafficKind.tag = 1
        trafficNo.delegate = self
        adoutAddCarNoImage()
    

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    @objc func addCarNoAction() {
                if addCarNoBtn.tag == 0 {
                    addCarNoBtn.image = UIImage(named: "icon_checkbox_off")
                    addCarNoBtn.tag = 1
                } else{
                    addCarNoBtn.image = UIImage(named: "icon_checkbox_ov")
                    addCarNoBtn.tag = 0
                }

    }

    @IBAction func addBtn(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OftenUseCarNoViewController") as! OftenUseCarNoViewController
        print(cityPick)
        print(trafficKind)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
    func adoutAddCarNoImage(){
        addCarNoBtn.tag = 1
        let addCarNoBtnGester = UITapGestureRecognizer.init(target: self, action: #selector(addCarNoAction))
        addCarNoBtn.addGestureRecognizer(addCarNoBtnGester)
        addCarNoBtn.isUserInteractionEnabled = true

    }

}





extension LifePayMentMainViewController: UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
             return cityPickerData.count
        } else {
            return trafficPickerData.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        pickerView.subviews[1].isHidden = true
        pickerView.subviews[2].isHidden = true
        
        if pickerView.tag == 0 {
           return cityPickerData[row]
        } else {
           return trafficPickerData[row]
        }
       
    }
    
    
}
