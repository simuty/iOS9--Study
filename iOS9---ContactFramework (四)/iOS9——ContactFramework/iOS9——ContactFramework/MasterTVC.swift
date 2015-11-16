//
//  MasterTVC.swift
//  iOS9——ContactFramework
//
//  Created by 51Testing on 15/11/13.
//  Copyright © 2015年 HHW. All rights reserved.
//

import UIKit
import ContactsUI
import Contacts

class MasterTVC: UITableViewController {

    //存储本地联系人数组
    var contacts = [CNContact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //开辟一条线程获取本地联系人
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            self.contacts = self.findContacts()
            //回主线程刷新UI（必须在主线程刷新）
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
            })
        }
        
    }

    func findContacts() -> [CNContact] {
    
        let store = CNContactStore()
        //定义需要匹配的规则
        let keysToFetch = [CNContactFormatter.descriptorForRequiredKeysForStyle(.FullName), CNContactImageDataKey, CNContactPhoneNumbersKey]
        let fetchRequest = CNContactFetchRequest(keysToFetch: keysToFetch)
        
        var contactsArray = [CNContact]()
     
        do{
          try store.enumerateContactsWithFetchRequest(fetchRequest, usingBlock: { (let contact, let stop) -> Void in
                contactsArray.append(contact)
            })
           
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
       
        return contactsArray
        
    }
  

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let contact = contacts[indexPath.row] as CNContact
        cell.textLabel!.text = "\(contact.givenName) \(contact.familyName)"
        return cell
    }
    
    
    //页面跳转
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //注意设置Storyboard segue的 Identifier
        if segue.identifier == "ContactInfo" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let didContact = contacts[indexPath.row]
                let controller = segue.destinationViewController as! ContactInfo
                //传contact
                controller.contact = didContact
                
            }
        
        }
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
}
