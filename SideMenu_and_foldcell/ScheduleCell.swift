//
//  ScheduleCell.swift
//  FoldingCell
//
//  Created by Keita Suzuki on 2017/09/05.
//

import Foundation
import FoldingCell

class ScheduleCell: InheritedCell {
    
    
    @IBOutlet weak var MonthLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    
    @IBOutlet weak var DayOfTheWeek: UILabel!
    func fillcell(){
        let date = Date()
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let weekday = calendar.component(.weekday, from: date)
        let weekdaySymbols = calendar.weekdaySymbols[weekday - 1]
        MonthLabel.text = String(month) + "月"
        DateLabel.text = String(day)
        DayOfTheWeek.text = String(weekdaySymbols)
    }
}
