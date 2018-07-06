//
//  ChooseLocationViewController.swift
//  AllProject
//
//  Created by 劉彥廷 on 2018/7/2.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ChooseLocationViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {

    @IBOutlet weak var addressText: UILabel!
    @IBOutlet weak var myMapView: MKMapView!
    
    var myLocationManager :CLLocationManager!
//    var myMapView :MKMapView!
    

    var lat :Double?
    var lon :Double?
    var chooseLocation :String!
    var addChooseLocation: (()->())?


    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 首次使用 向使用者詢問定位自身位置權限
        if CLLocationManager.authorizationStatus()
            == .notDetermined {
            // 取得定位服務授權
            myLocationManager.requestWhenInUseAuthorization()
            
            // 開始定位自身位置
            myLocationManager.startUpdatingLocation()
            
        }
            // 使用者已經拒絕定位自身位置權限
        else if CLLocationManager.authorizationStatus()
            == .denied {
            // 提示可至[設定]中開啟權限
            let alertController = UIAlertController(
                title: "定位權限已關閉",
                message:
                "如要變更權限，請至 設定 > 隱私權 > 定位服務 開啟",
                preferredStyle: .alert)
            let okAction = UIAlertAction(
                title: "確認", style: .default, handler:nil)
            alertController.addAction(okAction)
            self.present(
                alertController,
                animated: true, completion: nil)
        }
            // 使用者已經同意定位自身位置權限
        else if CLLocationManager.authorizationStatus()
            == .authorizedWhenInUse {
            // 開始定位自身位置
            myLocationManager.startUpdatingLocation()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        myLocationManager = CLLocationManager()
        myLocationManager.delegate = self
        myMapView.delegate = self
        
        // 顯示自身定位位置
        myMapView.showsUserLocation = true
        // 允許縮放地圖
        myMapView.isZoomEnabled = true

        
      
        
        // 取得自身定位位置的精確度
        myLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // 距離篩選器 用來設置移動多遠距離才觸發委任方法更新位置
//        myLocationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        myLocationManager.distanceFilter = CLLocationDistance(30)
        /*表示移動10公尺再更新座標資訊
         myLocationManager.distanceFilter = CLLocationDistance(10)
         */

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        // 印出目前所在位置座標
        let currentLocation :CLLocation =
            locations[0] as CLLocation
//        print("\(currentLocation.coordinate.latitude)")
//        print(", \(currentLocation.coordinate.longitude)")
        lat = currentLocation.coordinate.latitude
        lon = currentLocation.coordinate.longitude
        
        // 地圖預設顯示的範圍大小 (數字越小越精確)
        let latDelta = 0.005
        let longDelta = 0.005
        let currentLocationSpan :MKCoordinateSpan =
            MKCoordinateSpanMake(latDelta, longDelta)
        
//        print(" 中心點座標\(lat)\(lon)")
        
        // 設置地圖顯示的範圍與中心點座標
        let center :CLLocation = CLLocation(latitude: lat! , longitude: lon!)
        let currentRegion :MKCoordinateRegion = MKCoordinateRegion(
            center :center.coordinate,
            span :currentLocationSpan)
        myMapView.setRegion(currentRegion, animated: true)
        myLocationManager.stopUpdatingLocation()

        
    }
    
//    regionDidChangeAnimated 獲取移動後的中心點位置
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
           let center = mapView.region.center
//
//        print("center lat >>> \(center.latitude)")
//        print("center long >>>\(center.latitude)")
        
        
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude :center.latitude, longitude :center.longitude)


        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            
            // Place details
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
            
            var city :String?
            var root :String?
            if placeMark.locality != nil {
                city = placeMark.locality
            }
            if placeMark.name != nil {
                root = placeMark.name
            }
            self.addressText.text = "\(city!)\(root!)"
            self.chooseLocation = "\(city!)\(root!)"
        })
        
    }
    

    @IBAction func chooseLocationBtn(_ sender: Any) {
        self.addChooseLocation?()

        _ = navigationController?.popViewController(animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        myLocationManager.stopUpdatingLocation()
    }


}
