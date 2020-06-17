//
//  CalendarModel.swift
//  Calendar-Challenge
//
//  Created by Mac on 6/17/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

struct CalendarModel {
    
    // Months Info
    var monthNames: [String] = [ "Muharram", "Safar", "Rabiul avval", "Rabiul oxir", "Jumodul avval", "Jumo-dul oxir", "Rajab", "Sha'ban", "Ramadan", "Shavval", "Zulqa'da", "Zulhijja"]
    var months: [String] = ["Yanvar 2020" ,"Fevral 2020", "Mart 2020", "Aprel 2020", "May 2020", "Iyun 2020", "Iyul 2020", "Avgust 2020", "Sentabr 2020", "Oktabr 2020", "Noyabr 2020", "Dekabr 2020"]
    var currentMonth = 0
    
    
    // Days Info
    var startingDayOptions = [0, 1 , 2, 3, 4, 5]
    var currentDay = 15
    var dayNames:[String] = []
    var goodPosition:[String] = ["2", "4", "7", "13"]
    var normalPosition:[String] = ["3", "5", "6", "10", "11"]
    var notNormalPosition:[String] = ["1", "8", "12", "14", "15"]
    var badPosition:[String] = ["9"]
    var veryBadPosition:[String] = ["16"]
    var days:[String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]
    var dayColor:[String: UIColor] = ["good": #colorLiteral(red: 0.05882352941, green: 0.6588235294, blue: 0.3058823529, alpha: 1),
                                    "normal": #colorLiteral(red: 0.9098039216, green: 0.8078431373, blue: 0.8039215686, alpha: 1),
                                    "notNormal": #colorLiteral(red: 0.6941176471, green: 0.3098039216, blue: 0.3411764706, alpha: 1),
                                    "bad": #colorLiteral(red: 0.631372549, green: 0.137254902, blue: 0.1803921569, alpha: 1),
                                    "veryBad": #colorLiteral(red: 0.7490196078, green: 0.7450980392, blue: 0.7607843137, alpha: 1),
                                    "none": #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                                    "notComeDay": #colorLiteral(red: 0.6039215686, green: 0.6039215686, blue: 0.6117647059, alpha: 1),
                                    "noDays": #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) ]
    
    
    func checkPosition(checkPositon position: String) -> UIColor? {
        
        if goodPosition.contains(position) {
            return dayColor["good"]
        }
        if badPosition.contains(position) {
            return dayColor["bad"]
        }
        if normalPosition.contains(position) {
            return dayColor["normal"]
        }
        if notNormalPosition.contains(position) {
            return dayColor["notNormal"]
        }
    
        if veryBadPosition.contains(position) {
            return dayColor["veryBad"]
        }
        
        return UIColor.white
    }
    
    func checkDayColor(_ position: String) -> UIColor {
        if goodPosition.contains(position) || badPosition.contains(position) ||
            normalPosition.contains(position) || notNormalPosition.contains(position) ||
            veryBadPosition.contains(position) {
            return UIColor.white
        } else {
            return UIColor.black
        }
    }
}
