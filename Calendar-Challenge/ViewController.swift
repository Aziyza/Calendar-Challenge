//
//  ViewController.swift
//  Calendar-Challenge
//
//  Created by Mac on 6/17/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var calendarModel = CalendarModel()

    //MARK: - Declaring CollectionView IBOutlets
    @IBOutlet weak var monthCollectionView: UICollectionView! {
        didSet {
            monthCollectionView.delegate = self
            monthCollectionView.dataSource = self
            monthCollectionView.register(UINib(nibName: "MonthCell", bundle: nil), forCellWithReuseIdentifier: "MonthCell")
        }
    }
    
    @IBOutlet weak var CalendarCollectionView: UICollectionView! {
        didSet {
            CalendarCollectionView.delegate = self
            CalendarCollectionView.dataSource = self
            CalendarCollectionView.register(UINib(nibName: "CalendarCell", bundle: nil), forCellWithReuseIdentifier: "CalendarCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //MARK: - UIButton Actions
    @IBAction func leftTapped(_ sender: UIButton) {
        
        if calendarModel.currentMonth > 0 {
            calendarModel.currentMonth -= 1
            monthCollectionView.scrollToItem(at: IndexPath(item: calendarModel.currentMonth, section: 0), at: .centeredHorizontally, animated: true)
            CalendarCollectionView.scrollToItem(at: IndexPath(item: calendarModel.currentMonth, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    @IBAction func rightTapped(_ sender: UIButton) {
        
        if calendarModel.currentMonth+1 < calendarModel.monthNames.count {
            calendarModel.currentMonth += 1
            monthCollectionView.scrollToItem(at: IndexPath(item: calendarModel.currentMonth, section: 0), at: .centeredHorizontally, animated: true)
            CalendarCollectionView.scrollToItem(at: IndexPath(item: calendarModel.currentMonth, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
}


//MARK: - CollectionView Configuration
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return calendarModel.monthNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Month Collection View Cell
        if collectionView == monthCollectionView {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MonthCell", for: indexPath) as? MonthCell else {return UICollectionViewCell()}
            cell.dateLabel.text = calendarModel.months[indexPath.row]
            cell.prevMonthLabel.text = calendarModel.monthNames[indexPath.row]
            if indexPath.row+1 == calendarModel.monthNames.count {
                cell.nextMonthLabel.text = calendarModel.monthNames[0]
            }
            if indexPath.row+1 < calendarModel.monthNames.count {
                cell.nextMonthLabel.text = calendarModel.monthNames[indexPath.row+1]
            }
            
            return cell
            
        }
        // Day Collection View Cell
        else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as? CalendarCell else {return UICollectionViewCell()}
            
            return cell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}

