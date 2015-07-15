//
//  ViewController.swift
//  Proximitytest
//

import UIKit

//blueberrry_! break room
let BEACON_1_UUID = "B9407F30-F5F8-466E-AFF9-25556B57FE6D"
let BEACON_1_MAJOR: CLBeaconMajorValue = 4543
let BEACON_1_MINOR: CLBeaconMinorValue = 24404

class ViewController: UIViewController, ESTBeaconManagerDelegate{
    
    let beaconManager = ESTBeaconManager()
    
    let beaconRegion1 = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: BEACON_1_UUID)!, major: BEACON_1_MAJOR, minor: BEACON_1_MINOR, identifier: "beaconRegion1")
    
    //Label to display the proximity
    @IBOutlet var beaconLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //sets the beacon delegate
        self.beaconManager.delegate = self
        self.beaconManager.returnAllRangedBeaconsAtOnce = true
        
        self.beaconManager.requestWhenInUseAuthorization()
        
        beaconRegion1.notifyOnEntry = true
        beaconRegion1.notifyOnExit = true
        
        beaconManager.startRangingBeaconsInRegion(beaconRegion1)
        beaconManager.startMonitoringForRegion(beaconRegion1)
        beaconManager.requestAlwaysAuthorization()
        
    }
    
    //did enter region
    @objc func beaconManager(manager: AnyObject!, didEnterRegion region: CLBeaconRegion!) {
        let notification : UILocalNotification = UILocalNotification()
        notification.alertBody = "Welcome to Delek's Secret offices!"
        print("You've entered Delek!")
        UIApplication.sharedApplication().presentLocalNotificationNow(notification)
    }
    
    
    func beaconManager(manager: AnyObject!, didExitRegion region: CLBeaconRegion!) {
        let notification : UILocalNotification = UILocalNotification()
        notification.alertBody = "You've exited Delek's Secret offices!"
        notification.soundName = "Exit.wav"
        print("You've exited")
        UIApplication.sharedApplication().presentLocalNotificationNow(notification)
    }
    
    func beaconManager(manager: AnyObject!, monitoringDidFailForRegion region: CLBeaconRegion!, withError error: NSError!) {
        print("region did fail")
    }
    

}


