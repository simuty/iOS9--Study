//
//  ListTableViewController.swift
//  iOS9-CoreSpotlight
//
//  Created by 51Testing on 15/11/11.
//  Copyright © 2015年 HHW. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    let dataSource = DataSource()
    var lastSelectPeople: PersonModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //测试保存一些数据
        dataSource.savePeopleToIndex()
        tableView.rowHeight = 80
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! ViewController
        destination.showPerson = lastSelectPeople!
    }
    
    func  showPerson(id: String) {
        lastSelectPeople = dataSource.friendFromID(id)
        performSegueWithIdentifier("showInfo", sender: self)
    }
    
    
}





extension ListTableViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.peopleArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let people = dataSource.peopleArray[indexPath.row]
        cell.textLabel!.text = people.name
        cell.imageView?.image = people.image
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectIndex = tableView.indexPathForSelectedRow?.row
        lastSelectPeople = dataSource.peopleArray[selectIndex!]
        
//在StoryBoard 中设置过跳转但是无效，再次设置跳转的Indentifier;
        performSegueWithIdentifier("showInfo", sender: self)
    }
    
 
}
