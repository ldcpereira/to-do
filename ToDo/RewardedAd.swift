//
//  RewardedAd.swift
//  ToDo
//
//  Created by Lucas Pereira on 13/06/23.
//

import Foundation
import GoogleMobileAds

final class RewardedAd {
    private let rewardID = "ca-app-pub-3940256099942544/2934735716"
    
   var bannerView: GADBannerView!
    
    init () {
        load()
    }
    
    func load() {
        bannerView = GADBannerView(adSize: GADAdSizeFluid)
        bannerView.adUnitID = rewardID
       // bannerView.rootViewController = UIApplication.shared.keyWindowPresentedController
       // bannerView.load(GADRequest())
    }
    
    /*func load2() {
        let request = GADRequest()
        // add extras here to the request, for example, for not personalized Ads
        
        GADRewardedAd.load(withAdUnitID: rewardID, request: request, completionHandler: {rewardedAd, error in
            if (error != nil) {
                print("\(error != nil ? error?.localizedDescription : "" ?? "")")
                return
            } else {
                print("success")
                self.rewardedAd = rewardedAd
            }
        })
    }*/
    
    func showAd(rewardFunction: @escaping () -> Void) -> Bool {
        guard let bannerView = bannerView else {
            return false
        }
        
        guard let root = UIApplication.shared.keyWindowPresentedController else {
            return false
        }
        bannerView.rootViewController = root
        
        return true
    }
    
    /*func showAd(rewardFunction: @escaping () -> Void) -> Bool {
        guard let rewardedAd = rewardedAd else {
            return false
        }
        
        guard let root = UIApplication.shared.keyWindowPresentedController else {
            return false
        }
        rewardedAd.present(fromRootViewController: root, userDidEarnRewardHandler: rewardFunction)
        return true
    }*/
}

// just an extension to make our life easier to receive the root view controller
extension UIApplication {
    
    var keyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
    
    var keyWindowPresentedController: UIViewController? {
        var viewController = self.keyWindow?.rootViewController
        
        if let presentedController = viewController as? UITabBarController {
            viewController = presentedController.selectedViewController
        }
        
        while let presentedController = viewController?.presentedViewController {
            if let presentedController = presentedController as? UITabBarController {
                viewController = presentedController.selectedViewController
            } else {
                viewController = presentedController
            }
        }
        return viewController
    }
}
