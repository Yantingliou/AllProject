//
//  CallCarMainViewController.swift
//  AllProject
//
//  Created by 劉彥廷 on 2018/6/26.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

class CallCarMainViewController: UIViewController,UITextFieldDelegate,UIScrollViewDelegate {

    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var aliasLocationName: UILabel!
    @IBOutlet weak var oftenUseLocationName: UILabel!
    @IBOutlet weak var oftenLocationViewHeigth: NSLayoutConstraint!
    
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var wheelChair: UIImageView!
    @IBOutlet weak var largeLuggage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
         wheelChair.tag = 0
         largeLuggage.tag = 0
        self.scrollView.delegate = self
        
        
        //show keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)

        // 特殊需求 btn
         let wheelChairBtnaddGester = UITapGestureRecognizer.init(target: self, action: #selector(wheelChairBtn(_:)))

        let largeLuggageBtnaddGester = UITapGestureRecognizer.init(target: self, action: #selector(luggageBtn))
        
        wheelChair.addGestureRecognizer(wheelChairBtnaddGester)
        largeLuggage.addGestureRecognizer(largeLuggageBtnaddGester)
        
        largeLuggage.isUserInteractionEnabled = true
        wheelChair.isUserInteractionEnabled = true
    }

    @objc func wheelChairBtn(_ sender: UITapGestureRecognizer){
       
            if wheelChair.tag == 0 {
                wheelChair.image =  UIImage(named: "icon_checkbox_ov")
                wheelChair.tag = 1
            } else {
                wheelChair.image = UIImage.init(named: "icon_checkbox_off")
                wheelChair.tag = 0
            }
    }
    
    @objc func luggageBtn() {
        if largeLuggage.tag == 0 {
            largeLuggage.image =  UIImage(named: "icon_checkbox_ov")
            largeLuggage.tag = 1
        } else {
            largeLuggage.image = UIImage.init(named: "icon_checkbox_off")
            largeLuggage.tag = 0
        }
    }
    
   // 複寫（當碰觸螢幕）這裡沒反應

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
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

    @IBAction func callCarBtn(_ sender: Any) {
        
    let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchCarViewController") as! SearchCarViewController
        vc.address = location.text
        self.navigationController?.pushViewController(vc, animated: true)

        
    }
    

}


