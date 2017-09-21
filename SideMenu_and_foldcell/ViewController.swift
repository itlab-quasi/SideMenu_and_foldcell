//
//  ViewController.swift
//  SideMenu_and_foldcell
//
//  Created by Keita Suzuki on 2017/09/03.
//  Copyright © 2017年 鈴木慶汰. All rights reserved.
//

import UIKit
import LGSideMenuController
import FoldingCell
import SwiftyJSON

class ViewController: UITableViewController {

    private let closeCellHeight: CGFloat = 148
    private let openCellHeight: CGFloat = 368
    
    private let cellCount = 3
    
    private var cellHeights: [CGFloat] = []
    var OpenWeatherMapUrl = "http://api.openweathermap.org/data/2.5/weather?units=metric&q=Tokyo,jp&APPID=de5f9ac9b88f73db96bb54f5aec2e230"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        cellHeights = Array.init(repeating: closeCellHeight, count: cellCount)
        //openweathermap()
        //tableView.backgroundColor = UIColor.gray
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 3 == 0{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? WeatherCell else {
            fatalError("Could not create SampleCell")
        }
            
            // openweathermapApiを用いて各情報を取得
            let url = NSURL(string: self.OpenWeatherMapUrl)!
            let task = URLSession.shared.dataTask(with: url as URL, completionHandler: {data, response, error in
                DispatchQueue.main.async{
                    let json = JSON(data: data!)
/*              self.DateLabel.text = "Today"*/
                     let HighTemp = "Max: " + String(describing: json["main"]["temp_max"]) + "°C"
                     let LowTemp = "Min: " + String(describing: json["main"]["temp_min"]) + "°C"
                     let RainPercent = "Rain: " + String(describing: json["main"]["humidity"]) + "%"
                     let CurTemp = String(describing: json["main"]["temp"]) + "°C"
                     
                     let icon_url = URL(string: "http://openweathermap.org/img/w/" + String(describing: json["weather"][0]["icon"]) + ".png")
                     let session = URLSession(configuration: .default)
                     
                     let downloadPicTask = session.dataTask(with: icon_url!) { (data, response, error) in
                     DispatchQueue.main.async{
                        if let e = error {
                            print("\(e)")
                        } else {
                            if let _ = response as? HTTPURLResponse {
                                if let imageData = data {
                                    let imageimage = UIImage(data: imageData)
                                    cell.fillCell(icon: imageimage!, curtemp: CurTemp, hightemp: HighTemp, lowtemp: LowTemp, rainpercent: RainPercent)
                                } else {
                                    print("画像を取得できませんでした：画像はありません")
                                }
                            } else {
                                print("何らかの理由で応答コードを取得できませんでした")
                            }
                     }
                     }
                     }
                     
                     downloadPicTask.resume()
                    //print(icon_url)
                    print(json)
                }
            })
            task.resume()
            
            return cell
        } else if indexPath.row % 3 == 1{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellTwo") as? ScheduleCell else {
                fatalError("Could not create SampleCell")
            }
            cell.fillcell()
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellThree") as? InheritedCell else {
            fatalError("Could not create SampleCell")
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard case let cell as InheritedCell = tableView.cellForRow(at: indexPath) else {
            return
        }
        
        var duration = 0.0
        if cellHeights[indexPath.row] == closeCellHeight { // open cell
            cellHeights[indexPath.row] = openCellHeight
            cell.selectedAnimation(true, animated: true, completion: nil)
            duration = 0.5
        } else {// close cell
            cellHeights[indexPath.row] = closeCellHeight
            cell.selectedAnimation(false, animated: true, completion: nil)
            duration = 1.1
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
            tableView.beginUpdates()
            tableView.endUpdates()
        }, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if case let cell as InheritedCell = cell {
            if cellHeights[indexPath.row] == closeCellHeight {
                cell.selectedAnimation(false, animated: false, completion:nil)
            } else {
                cell.selectedAnimation(true, animated: false, completion: nil)
            }
        }
    }
    
    func openweathermap(){
        // openweathermapApiを用いて各情報を取得
        let url = NSURL(string: self.OpenWeatherMapUrl)!
        let task = URLSession.shared.dataTask(with: url as URL, completionHandler: {data, response, error in
            DispatchQueue.main.async{
                let json = JSON(data: data!)
/*              self.DateLabel.text = "Today"
                self.maxTempLabel.text = "Max: " + String(describing: json["main"]["temp_max"]) + "°C"
                self.minTempLabel.text = "Min: " + String(describing: json["main"]["temp_min"]) + "°C"
                self.RainPercentLabel.text = "Rain: " + String(describing: json["main"]["humidity"]) + "%"
                self.CurTempLabel.text = String(describing: json["main"]["temp"]) + "°C"
                
                let icon_url = URL(string: "http://openweathermap.org/img/w/" + String(describing: json["weather"][0]["icon"]) + ".png")
                let session = URLSession(configuration: .default)
                
                let downloadPicTask = session.dataTask(with: icon_url!) { (data, response, error) in
                    DispatchQueue.main.async{
                        if let e = error {
                            print("\(e)")
                        } else {
                            if let _ = response as? HTTPURLResponse {
                                if let imageData = data {
                                    let imageimage = UIImage(data: imageData)
                                    self.WeatherImageView.image = imageimage
                                } else {
                                    print("画像を取得できませんでした：画像はありません")
                                }
                            } else {
                                print("何らかの理由で応答コードを取得できませんでした")
                            }
                        }
                    }
                }
                
                downloadPicTask.resume()*/
                //print(icon_url)
                //print(json)
            }
        })
        task.resume()
    }
    
}

