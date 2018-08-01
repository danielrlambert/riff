//
//  YourGifVC.swift
//  Riff
//
//  Created by Boariu Andy on 7/31/18.
//  Copyright © 2018 Plush Republic, Inc. All rights reserved.
//

import UIKit
import GiphyCoreSDK
import SwiftyGif

class YourGifVC: UIViewController {
    
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var txvDescription: UITextView!
    @IBOutlet weak var imgvGiff: UIImageView!
    
    var yourStatus = ""
    
    let gifManager = SwiftyGifManager(memoryLimit:50)
    
    // MARK: - View Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        getAllGiphysForSearchText(strSearch: txvDescription.text)
    }
    
    // MARK: - Notification Methods
    
    // MARK: - Public Methods
    
    // MARK: - Custom Methods
    
    private func setupUI() {
        viewTop.layer.shadowOffset = CGSize(width: 0, height: 5)
        viewTop.layer.shadowOpacity = 0.3
        viewTop.layer.shadowRadius = 2.0
        viewTop.layer.shadowColor = UIColor.darkGray.cgColor
        
        txvDescription.text = yourStatus

    }
    
    private func getAllGiphysForSearchText(strSearch: String) {
        /// Gif Search
        GiphyCore.shared.search("cats") { (response, error) in
            
            if let error = error as NSError? {
                // Do what you want with the error
            }
            
            if let response = response, let data = response.data, let pagination = response.pagination {
                print(response.meta)
                print(pagination)
                
                if let gif = data.first {
                    
                    self.loadGif(url: gif.embedUrl!)
                }
                
            } else {
                print("No Results Found")
            }
        }
    }
    
    private func loadGif(url: String) {
        if let url = URL(string: url) {
            DispatchQueue.main.async {
                // Always update UI on the main thread
                self.imgvGiff.setGifFromURL(url, manager: self.gifManager, loopCount: -1, showLoader: true)
            }
        }
    }
    
    // MARK: - API Methods
    
    // MARK: - Action Methods
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSeeOtherRiffsAction(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RiffsVC") as? RiffsVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    // MARK: - Memory Cleanup

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
