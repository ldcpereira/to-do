//
//  ViewController.swift
//  ToDo
//
//  Created by Lucas Pereira on 13/06/23.
//

import UIKit
import SwiftUI
import GoogleMobileAds

struct ViewController: UIViewControllerRepresentable {
    
    private let rewardID = "ca-app-pub-3940256099942544/2934735716"
    var bannerView: GADBannerView
    
    func viewDidLoad() {
        bannerView = GADBannerView(adSize: GADAdSizeFluid)
        
        bannerView.adUnitID = rewardID
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return UIViewController().viewDidLoad()
    }
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    
}

