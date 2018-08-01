//
//  YourGifVC.swift
//  Riff
//
//  Created by Boariu Andy on 7/31/18.
//  Copyright © 2018 Plush Republic, Inc. All rights reserved.
//

import UIKit
import GiphyCoreSDK

class YourGifVC: UIViewController {
    
    // MARK: - View Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Notification Methods
    
    // MARK: - Public Methods
    
    // MARK: - Custom Methods
    
    private func getAllGiphysForSearchText(strSearch: String) {
        /// Gif Search
        GiphyCore.shared.search("cats") { (response, error) in
            
            if let error = error as NSError? {
                // Do what you want with the error
            }
            
            if let response = response, let data = response.data, let pagination = response.pagination {
                print(response.meta)
                print(pagination)
                for result in data {
                    print(result)
                }
            } else {
                print("No Results Found")
            }
        }
    }
    
    // MARK: - API Methods
    
    // MARK: - Action Methods
    
    @IBAction func btnFemaleAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSeeOtherRiffsAction(_ sender: UIButton) {
        
    }
    // MARK: - Memory Cleanup

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
