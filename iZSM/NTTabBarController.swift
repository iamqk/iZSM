//
//  NTTabBarController.swift
//  iZSM
//
//  Created by Naitong Yu on 2017/7/13.
//  Copyright © 2017 Naitong Yu. All rights reserved.
//

import UIKit
import SVProgressHUD

class NTTabBarController: UITabBarController {
    
    override var title: String? {
        get {
            switch selectedIndex {
            case 0:
                return "热点话题"
            case 1:
                return "版面列表"
            case 2:
                return "收藏夹"
            case 3:
                return "用户设置"
            default:
                return nil
            }
        }
        set {
            super.title = newValue
        }
    }
    
    override var shouldAutorotate: Bool {
        return globalShouldRotate
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if globalLockPortrait {
            return [.portrait, .portraitUpsideDown]
        } else {
            return .all
        }
    }
    
    override var childForStatusBarHidden: UIViewController? {
        return selectedViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        updateSVProgressHUDStyle()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if previousTraitCollection?.userInterfaceStyle != traitCollection.userInterfaceStyle {
            updateSVProgressHUDStyle()
        }
    }
    
    private func updateSVProgressHUDStyle() {
        if traitCollection.userInterfaceStyle == .dark {
            SVProgressHUD.setDefaultStyle(.dark)
        } else {
            SVProgressHUD.setDefaultStyle(.light)
        }
    }
}
