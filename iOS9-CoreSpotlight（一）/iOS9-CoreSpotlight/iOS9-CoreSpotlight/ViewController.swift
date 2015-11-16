//
//  ViewController.swift
//  iOS9-CoreSpotlight
//
//  Created by 51Testing on 15/11/11.
//  Copyright © 2015年 HHW. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    var showPerson: PersonModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = showPerson?.name
        icon.image = showPerson?.image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

