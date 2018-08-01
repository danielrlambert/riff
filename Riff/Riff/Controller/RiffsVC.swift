//
//  RiffsVC.swift
//  Riff
//
//  Created by Boariu Andy on 7/31/18.
//  Copyright © 2018 Plush Republic, Inc. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class RiffsVC: UIViewController {
    
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var arrRiffs = [Riff]()
    
    
    // MARK: - View Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        loadAllRiffs()
        setupUI()
    }
    
    // MARK: - Notification Methods
    
    // MARK: - Public Methods
    
    // MARK: - Custom Methods
    
    private func setupUI() {
        viewTop.layer.shadowOffset = CGSize(width: 0, height: 5)
        viewTop.layer.shadowOpacity = 0.3
        viewTop.layer.shadowRadius = 2.0
        viewTop.layer.shadowColor = UIColor.darkGray.cgColor
    }
    
    private func loadAllRiffs() {
        appDelegate.ref.child(Constants.RiffKeys.riff).observeSingleEvent(of: .value) { [weak self] (snapshot) in
            guard let me = self else { return }
            
            for data in snapshot.children {
                if let dataRiff = data as? DataSnapshot {
                    if var dictRiff = dataRiff.value as? [String: AnyObject] {
                        
                        let riff = Riff()
                        riff.strGender = dictRiff[Constants.RiffKeys.gender] as? String
                        riff.strAge = dictRiff[Constants.RiffKeys.age] as? String
                        riff.strStatus = dictRiff[Constants.RiffKeys.status] as? String
                        
                        me.arrRiffs.append(riff)
                        
                    }
                }
            }
            
            me.tableView.reloadData()
        }
    }
    
    // MARK: - API Methods
    
    // MARK: - Action Methods
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Memory Cleanup

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - UITableView Methods

extension RiffsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRiffs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RiffsCellID") as! RiffsCell
        
        let riff = arrRiffs[indexPath.row]
        
        cell.loadData(riff: riff)
        
        return cell
    }
    
}

extension UIColor {
    class func riffGreen() -> UIColor {
        return UIColor(red: 100.0/255, green: 183/255, blue: 178/255, alpha: 1.0)
    }
    
    class func riffRed() -> UIColor {
        return UIColor(red: 244.0/255, green: 154.0/255, blue: 193/255, alpha: 1.0)
    }
}


