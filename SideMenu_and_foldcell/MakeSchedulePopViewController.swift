//
//  MakeSchedulePopViewController.swift
//  SideMenu_and_foldcell
//
//  Created by Keita Suzuki on 2017/09/06.
//  Copyright © 2017年 鈴木慶汰. All rights reserved.
//

import UIKit
import PopupDialog

class MakeSchedulePopViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var ContentTextView: UITextView!
    @IBOutlet weak var StartDateField: UITextField!
    @IBOutlet weak var EndDateField: UITextField!
    
    var toolBar:UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myColor : UIColor = UIColor( red: 0.5, green: 0.5, blue:0, alpha: 1.0 )
        
        ContentTextView.layer.borderColor = myColor.cgColor
        ContentTextView.layer.borderWidth = 1.0
        ContentTextView.layer.cornerRadius = 8.0
        
        let datePicker = UIDatePicker()
        StartDateField.inputView = datePicker
        
        // ②日本の日付表示形式にする
        datePicker.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
        // Do any additional setup after loading the view.
        
        EndDateField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
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
