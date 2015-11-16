//
//  ViewController.swift
//  iOS9——ContactFramework
//
//  Created by 51Testing on 15/11/13.
//  Copyright © 2015年 HHW. All rights reserved.
//

import UIKit
import ContactsUI
import Contacts

class ViewController: UIViewController , CNContactPickerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
//跳转到系统提供的联系人UI
    @IBAction func showSystemContectUI(sender: AnyObject) {
        //获取系统提供的联系人UI
        let contactPicker = CNContactPickerViewController()
        //设置代理
        contactPicker.delegate = self
        //CNContactIdentifierKey， 需要匹配查找的字段，
        contactPicker.displayedPropertyKeys = [CNContactPhoneNumbersKey, CNContactEmailAddressesKey, CNContactBirthdayKey]
        //跳转到系统提供的联系人UI
        self.presentViewController(contactPicker, animated: true, completion: nil)
    }
    
    
    //"取消"
    func contactPickerDidCancel(picker: CNContactPickerViewController) {
        print("取消")
    }
    //点击一个联系人时触发
    func contactPicker(picker: CNContactPickerViewController, didSelectContact contact: CNContact) {
        print(contact.nickname)
    }
    
    func contactPicker(picker: CNContactPickerViewController, didSelectContactProperty contactProperty: CNContactProperty) {
        print(contactProperty)
    }
    
    //选择多个联系人，点击Done，返回点击的联系人的数组
    func contactPicker(picker: CNContactPickerViewController, didSelectContacts contacts: [CNContact]) {
        print(contacts)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

