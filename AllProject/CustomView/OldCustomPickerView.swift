//
//  OldCustomPickerView.swift
//  AllProject
//
//  Created by 劉彥廷 on 2018/6/30.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

typealias CancelBlock = () -> Void
typealias Completed = (_ completedResult: [SelectObj]) -> Void
typealias PickerSelectBlock = (_ selectStr:String,_ component:Int,_ row:Int,_ picker: OldCustomPicker) -> ([String],Int)

class OldCustomPickerView: UIView {

    
    @IBOutlet weak var labeTitle: UILabel!
    @IBOutlet weak var customMask: UIView!
    @IBOutlet weak var picker: OldCustomPicker!
    @IBOutlet weak var pickerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var bottomLayout: NSLayoutConstraint!
    
    var dismissBlock: CancelBlock?
    var completedBlock: Completed?
    
    static func initPicker() -> OldCustomPickerView {
        let view = Bundle.main.loadNibNamed("OldCustomPickerView", owner: nil, options: nil)![0] as! OldCustomPickerView
        view.frame = UIScreen.main.bounds
        return view
    }
    
    func showWith(menu: [SectionObj]!, title: String, block: PickerSelectBlock?, completed: Completed?, dismiss: CancelBlock?) {
        self.load(menu: menu, title: title, block: block, completed: completed, dismiss: dismiss)
        self.showPicker()
    }
    
    static func showWith(menu: [SectionObj]!, title: String, block: PickerSelectBlock?, completed: Completed?, dismiss: CancelBlock?) -> OldCustomPickerView {
        let view = Bundle.main.loadNibNamed("OldCustomPickerView", owner: nil, options: nil)![0] as! OldCustomPickerView
        view.frame = UIScreen.main.bounds
        view.load(menu: menu, title: title, block: block, completed: completed, dismiss: dismiss)
        return view
    }
    
    func load(menu:[SectionObj]!, title:String, block: PickerSelectBlock?, completed: Completed?, dismiss: CancelBlock?) {
        picker.setPickerWith(obj: menu, block: block)
        self.dismissBlock = dismiss
        self.completedBlock = completed
        self.customMask.setBorder(width: 0, radius: 15, color: nil)
        self.labeTitle.text = title
        self.bottomLayout.constant -= pickerViewHeight.constant
    }
    
    @IBAction func disMiss(){
        self.picker.resetSelect()
        self.isShow(show: false)
        if let cancel = dismissBlock {
            cancel()
        }
    }
    
    @IBAction func confirm() {
        
        if let completed = completedBlock {
            completed(self.picker.getAllSelectObj())
        }
        self.isShow(show: false)
    }
    
    func showPicker(){
        let MainWindow = (UIApplication.shared.delegate as! AppDelegate).window!
        MainWindow.addSubview(self)
        self.picker.saveOriginalSelect()
        self.isShow(show: true)
    }
    
    func isShow(show:Bool){
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            if (show) {
                self.bottomLayout.constant = 0
            } else {
                self.bottomLayout.constant -= self.pickerViewHeight.constant
            }
            self.layoutIfNeeded()
            
        }) { (completed) -> Void in
            if(!show){
                self.removeFromSuperview()
            }
        }
    }
}
