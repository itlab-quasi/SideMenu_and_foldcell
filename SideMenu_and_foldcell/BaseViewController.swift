//
//  BaseViewController.swift
//  SideMenu_and_foldcell
//
//  Created by Keita Suzuki on 2017/09/06.
//  Copyright © 2017年 鈴木慶汰. All rights reserved.
//

import UIKit
import PopupDialog

class BaseViewController: UIViewController {

    @IBAction func addButton(_ sender: Any) {
        let vc = MakeSchedulePopViewController(nibName: "MakeSchedulePopViewController", bundle:nil)
        let popup = PopupDialog(viewController: vc)
        
        // OKボタンを作る
        let buttonOK = DefaultButton(title: "OK") {
            print("入力完了")
        }
        
        // ポップアップにボタンを追加
        popup.addButton(buttonOK)
        
        // 作成したポップアップを表示する
        present(popup, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
