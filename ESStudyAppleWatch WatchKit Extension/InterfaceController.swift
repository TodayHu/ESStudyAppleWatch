//
//  InterfaceController.swift
//  ESStudyAppleWatch WatchKit Extension
//
//  Created by MAEDAHAJIME on 2015/03/31.
//  Copyright (c) 2015年 MAEDAHAJIME. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    // スライダー表示ラベル
    @IBOutlet weak var countLabel: WKInterfaceLabel!
    // スライダー
    @IBOutlet weak var countSlider: WKInterfaceSlider!
    
    // スライダー数値がラベルに反映
    // 現在のカウントを保存するインスタンス変数を保存型プロパティで定義
    // プロパティにはdidSet、値が設定 -> ラベル (countLabel) に反映
    var count:Int32 = 0 {
        
        didSet {
            
            self.countLabel.setText(String(self.count))
            
            // カウント情報が更新されたときに、親アプリにカウントを通知するメソッドを呼び出します。
            self.updateParentCount()
        }
    }

    // 最初に呼び出されるメソッド
    // スライダーの初期値を設定
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // 初期値
        self.count = 100
        self.countSlider.setValue(Float(self.count))
        
        // Configure interface objects here.
        
    }
    
    // スライダーを操作したときに、それが示す値をカウントに反映
    @IBAction func countSliderAction(value: Float) {
        self.count = Int32(value)
    }
    
    // 親アプリへカウント値を送信
    func updateParentCount() {
        
        // ディクショナリに "count" をキーにしてカウント値を渡す
        // NSObject を継承した値を指定する必要があるので、カウント値をNSNumber型 に包んで渡す
        let userInfo = ["count" : NSNumber(int:self.count)]
        
        //println("親アプリカウント送信")
        
        // openParentApplication:reply:メソッドを呼び出すことで
        // 任意のディクショナリを親の iPhone アプリ側へ渡す
        WKInterfaceController.openParentApplication(userInfo) {
            
            // 親の iPhone アプリで用意した任意の情報と、
            // エラー情報とを受け取って処理するクロージャーを指定します。
            // 何もしないクロージャーを渡しておくことにしました。
            (reply, error) -> Void in
        }
        
        NSLog("%d", count)
    }
    

    // ユーザーにUIが表示されたタイミングで呼び出されるメソッド
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    // UIが非表示になったタイミングで呼び出されるメソッド
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
