//
//  InhertitedCell.swift
//  SideMenu_and_foldcell
//
//  Created by Keita Suzuki on 2017/09/03.
//  Copyright © 2017年 鈴木慶汰. All rights reserved.
//

import Foundation
import FoldingCell

class InheritedCell: FoldingCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor.clear
    }
    
    override func animationDuration(_ itemIndex:NSInteger, type:AnimationType)-> TimeInterval {
        let durations = [0.26, 0.2, 0.2]
        return durations[itemIndex]
    }
    
}
