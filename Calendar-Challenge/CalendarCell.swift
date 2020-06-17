//
//  CalendarCell.swift
//  Calendar-Challenge
//
//  Created by Aziyza's Mac on 6/17/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class CalendarCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var calendarModel = CalendarModel()
    
    
    
    @IBOutlet weak var dayCollectionView: UICollectionView! {
        didSet {
            dayCollectionView.delegate = self
            dayCollectionView.dataSource = self
            dayCollectionView.register(UINib(nibName: "DayCell", bundle: nil), forCellWithReuseIdentifier: "DayCell")
        }
    }    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // get ready to start corresponding day with respect to week days
        
        for index in 0...calendarModel.startingDayOptions[2] {
            calendarModel.days.insert(" ", at: index)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return calendarModel.days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DayCell", for: indexPath) as? DayCell else { return UICollectionViewCell() }
    
            cell.dayLabel.text = self.calendarModel.days[indexPath.row]
        
        if indexPath.row == calendarModel.currentDay + calendarModel.startingDayOptions[2] {
            cell.currentDayLine.isHidden = false
        }
        
        if let color = calendarModel.checkPosition(checkPositon: "\(cell.dayLabel.text ?? "")") {
            cell.dayColorView.backgroundColor = color
            let labelColor = calendarModel.checkDayColor("\(cell.dayLabel.text ?? "")")
            cell.dayLabel.textColor = labelColor
            cell.currentDayLine.backgroundColor = labelColor
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 30, height: 30)
    }
}

