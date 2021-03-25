//
//  globalFunction.swift
//  Coffee
//
//  Created by aa on 2021/1/5.
//

import Foundation

func changeName(str:String)->String{
    if str == "基隆" { return "Keelung"}
    if str == "台北" { return "Taipei"}
    if str == "桃園" { return "Taoyuan"}
    if str == "新竹" { return "Hsinchu"}
    if str == "苗栗" { return "Miaoli"}
    if str == "台中" { return "Taichung"}
    if str == "彰化" { return "Changhua"}
    if str == "南投" { return "Nantou"}
    if str == "雲林" { return "Yunlin"}
    if str == "嘉義" { return "Chiayi"}
    if str == "台南" { return "Tainan"}
    if str == "高雄" { return "Kaohsiung"}
    if str == "屏東" { return "Pingtung"}
    if str == "宜蘭" { return "Yilan"}
    if str == "花蓮" { return "Hualien"}
    if str == "台東" { return "Taitung"}
    if str == "澎湖" { return "Penghu"}
    if str == "媽祖" { return "Lienchiang"}
    
    return ""
}
