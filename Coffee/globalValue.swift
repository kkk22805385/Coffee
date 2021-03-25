//
//  golobalValue.swift
//  Coffee
//
//  Created by aa on 2021/1/5.
//

import Foundation
import ARKit

struct globalValue{
    let arrayCountry = ["全部","基隆","台北","桃園","新竹","苗栗","台中","彰化","南投","雲林", "嘉義" ,"台南","高雄" ,"屏東" ,"宜蘭"  ,"花蓮" ,"台東","澎湖", "媽祖"]    
}

struct type {
    var name:String
    var image:UIImage
}
struct CoffeeData: Decodable {
    /*
     id - 一組UUID
     name - 店名
     wifi - wifi 穩定
     seat - 通常有位
     quiet - 安靜程度
     tasty - 咖啡好喝
     cheap - 價格便宜
     music - 裝潢音樂
     address - 地址
     latitude - 緯度
     longitude - 經度
     url - 官網
     limited_time - 有無限時
     socket - 插座多
     standing_desk - 可站立工作
     mrt - 捷運站
     open_time - 營業時間
     */
    var name: String
    var city: String
    var wifi: Double
    var seat: Double
    var quiet: Double
    var tasty: Double
    var cheap: Double
    var music: Double
    var url: String
    var address: String
    var latitude: String
    var longitude: String
    var limited_time: String
    var socket: String
    var standing_desk: String
    var mrt: String
    var open_time: String
 }
