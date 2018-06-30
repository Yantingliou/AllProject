//
//  OldCustomPicker.swift
//  AllProject
//
//  Created by 劉彥廷 on 2018/6/30.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit
class OldCustomPicker:  UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate{
    
    let sectionsObj = NSMutableArray()
    var selectBlock: PickerSelectBlock?
    var origianlSelct = [Int]()
    
    func setPickerWith(obj: [SectionObj], block: PickerSelectBlock?) {
        sectionsObj.removeAllObjects()
        sectionsObj.addObjects(from: obj)
        selectBlock = block
        self.reloadAllComponents()
    }
    
    override func awakeFromNib() {
        self.dataSource = self
        self.delegate = self
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if let obj = sectionsObj[component] as? SectionObj {
            let str = obj.rowObjs[row]
            let attribute = NSAttributedString.init(string: str, attributes:  [NSAttributedStringKey.foregroundColor:UIColor(hex:"FFB907")])
          
            /*
             NSForegroundColorAttributeName 這裡格式在swift4 的時候已經改寫了
             參考網址
             http://tech.juhe18.com/ios/it827.html
             
             這一段原本是寫:
             
             */
            return attribute
        }
        return NSAttributedString()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let select = selectBlock {
            if let obj = sectionsObj[component] as? SectionObj{
                let str = obj.rowObjs[row]
                let block = select(str, component, row, self)
                //                if let replaceObj = sectionsObj[block.1] as? SectionObj, block.0.count > 0 {
                //                    replaceObj.rowObjs = block.0
                //                }
                self.reloadComponent(block.1)
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return sectionsObj.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if let obj = sectionsObj[component] as? SectionObj{
            return obj.rowObjs.count
        }
        return 0
    }
    
    func getAllSelectObj() -> [SelectObj]{
        let arr = NSMutableArray()
        for i in 0 ..< self.numberOfComponents {
            if let obj = sectionsObj[i] as? SectionObj{
                let row = self.selectedRow(inComponent: i)
                let str = obj.rowObjs[row]
                let select = SelectObj(str: str, component: i, row: row)
                arr.add(select)
            }
        }
        
        return arr as AnyObject as! [SelectObj]
    }
    
    func saveOriginalSelect() {
        origianlSelct.removeAll()
        for item in self.getAllSelectObj() {
            origianlSelct.append(item.selectRow)
        }
    }
    
    func resetSelect(){
        var component = 0
        for row in origianlSelct {
            self.selectRow(row, inComponent: component, animated: true)
            self.reloadComponent(component)
            self.pickerView(self, didSelectRow: row, inComponent: component)
            component += 1
        }
        self.reloadAllComponents()
    }
}

struct SectionObj {
    var rowObjs:[String]
    init(objs: [String]) {
        rowObjs = objs
    }
}

struct SelectObj {
    var component:Int
    var selectStr:String
    var selectRow:Int
    init(str: String,component: Int,row: Int) {
        self.component = component
        self.selectStr = str
        self.selectRow = row
    }
}


/*
 這個擴充的部分，再找時間研究
 */
