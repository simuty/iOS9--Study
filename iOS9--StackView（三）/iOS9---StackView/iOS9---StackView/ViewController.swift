//
//  ViewController.swift
//  iOS9---StackView
//
//  Created by 51Testing on 15/11/13.
//  Copyright © 2015年 HHW. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var peopleStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//对齐方式
    
//    Fill：子视图填充StackView。
//    Leading：靠左对齐。
//    Trailing：靠右对齐。
//    Center：子视图以中线为基准对齐。
//    Top：靠顶部对齐。
//    Bottom：靠底部对齐。
//    First Baseline：按照第一个子视图中文字的第一行对齐。
//    Last Baseline：按照最后一个子视图中文字的最后一行对齐。

    @IBAction func selectAlinmentStyle(sender: AnyObject) {
        UIView.animateWithDuration(1.0, delay: 0, options: .LayoutSubviews, animations: { () -> Void in
            
            switch sender.selectedSegmentIndex {
            case 0: self.peopleStackView.alignment = .Fill
            case 1: self.peopleStackView.alignment = .Top
            case 2: self.peopleStackView.alignment = .Center
            case 3: self.peopleStackView.alignment = .Bottom
            case 4: self.peopleStackView.alignment = .FirstBaseline
            case 5: self.peopleStackView.alignment = .LastBaseline
            default: print("")
            }
            
            }, completion: nil)
        
    }
//分布比例
    
//    Fill：默认分布方式。
//    Fill Equally：子视图的高度或宽度保持一致。
//    Fill：Proportionally：StackView自己计算出它认为合适的分布方式。
//    Equal Centering：每个子视图中心线之间保持一致的分布方式。
//    Equal Spacing：子视图保持同等间隔的分布方式。

    @IBAction func selectDistributionStyle(sender: AnyObject) {
        UIView.animateWithDuration(1.0, delay: 0, options: .OverrideInheritedDuration, animations: { () -> Void in
            switch sender.selectedSegmentIndex {
            case 0: self.peopleStackView.distribution = .Fill
            case 1: self.peopleStackView.distribution = .FillEqually
            case 2: self.peopleStackView.distribution = .FillProportionally
            case 3: self.peopleStackView.distribution = .EqualCentering
            case 4: self.peopleStackView.distribution = .EqualSpacing
            default: print("")
            }

            }, completion: nil)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

