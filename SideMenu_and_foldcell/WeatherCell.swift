//
//  WeatherCell.swift
//  SideMenu_and_foldcell
//
//  Created by Keita Suzuki on 2017/09/05.
//  Copyright © 2017年 鈴木慶汰. All rights reserved.
//

import Foundation
import FoldingCell

class WeatherCell: InheritedCell {
    
    @IBOutlet weak var WeatherImage: UIImageView!
    @IBOutlet weak var CurTempLabel: UILabel!
    @IBOutlet weak var HighTempLabel: UILabel!
    @IBOutlet weak var LowTempLabel: UILabel!
    @IBOutlet weak var RainPercentLabel: UILabel!
    @IBOutlet weak var MainWeather: UIImageView!
    @IBOutlet weak var MainCurTempLabel: UILabel!
    
    
    func fillCell(icon:UIImage, curtemp:String, hightemp:String, lowtemp:String, rainpercent:String){
        WeatherImage.image = icon
        CurTempLabel.text = curtemp
        HighTempLabel.text = hightemp
        LowTempLabel.text = lowtemp
        RainPercentLabel.text = rainpercent
        MainWeather.image = icon
        MainCurTempLabel.text = curtemp
    }
    
}
