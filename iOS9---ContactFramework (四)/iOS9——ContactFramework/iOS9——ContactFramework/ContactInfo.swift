//
//  ContactInfo.swift
//  iOS9——ContactFramework
//
//  Created by 51Testing on 15/11/13.
//  Copyright © 2015年 HHW. All rights reserved.
//

import UIKit
import Contacts

class ContactInfo: UIViewController {

    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var contactNameLab: UILabel!
    @IBOutlet weak var contactPhoneLab: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
    }
    
   // Swift - 属性观察者（willSet与didSet）
    //属性观察者，类似于触发器。用来监视属性的除初始化之外的属性值变化，当属性值发生改变时可以对此作出响应。
    var contact: CNContact? {
        didSet {
            self.configureView()
        }
    }
    
    func configureView() {

        if let contact = self.contact {
            if let label = self.contactNameLab {
                
                //CNContactFormatter 能够很好的格式化联系人的名字。我们所要做的仅仅是按需求格式化他们，formatter可以很好的控制格式。
                label.text = CNContactFormatter.stringFromContact(contact, style: .FullName)
            }
            
            if let imageView = self.contactImage {
                if contact.imageData != nil {
                    imageView.image = UIImage(data: contact.imageData!)
                }
                else {
                    imageView.image = nil
                }
            }
            
            if let phoneNumberLabel = self.contactPhoneLab {
                var numberArray = [String]()
                for number in contact.phoneNumbers {
                    let phoneNumber = number.value as! CNPhoneNumber
                    numberArray.append(phoneNumber.stringValue)
                }
                phoneNumberLabel.text = numberArray.joinWithSeparator(", ")
            }
        }
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
