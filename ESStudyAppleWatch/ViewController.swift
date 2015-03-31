//
//  ViewController.swift
//  ESStudyAppleWatch
//
//  Created by MAEDAHAJIME on 2015/03/31.
//  Copyright (c) 2015年 MAEDAHAJIME. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // カウントラベル
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /// カウント値が通知されたときに、その値をラベルに反映します。
    func applicationUpdateCountNotification(notification:NSNotification) {
        
        // 受け取ったカウント値をラベルに反映
        let count = notification.object as! NSNumber
        
        NSLog("受け取ったカウント値 %d", count)
        self.countLabel.text = count.description
    }
    
    /// ビューの表示直前に通知を受け取れる準備をします。
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        let nc = NSNotificationCenter.defaultCenter()
        nc.addObserver(self, selector: Selector("applicationUpdateCountNotification:"), name: ApplicationUpdateCountNotification, object: nil)
    }
    
    // ビューが非表示にされるときに通知を受け取らないようにしておきます。
    override func viewWillDisappear(animated: Bool) {
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
        super.viewWillDisappear(animated)
    }
}

