//
//  ViewController.swift
//  Navigation
//
//  Created by Vương Toàn Bắc on 5/28/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    let transiton = AnimatedTransitioning()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func actionMenu(_ sender: Any) {
        guard let menu = storyboard?.instantiateViewController(withIdentifier: "menu") as? MenuViewController else { return  }
        menu.didTapMenuType = {menuType in
            print(menuType)
            self.transitionToNew(menuType)
        }
        menu.modalPresentationStyle = .overCurrentContext
        menu.transitioningDelegate = self as! UIViewControllerTransitioningDelegate
        present(menu, animated: true)
    }
    
    func transitionToNew(_ menuType: MenuType) {
        
        switch menuType {
        case .Profile:
            print("b")
        case .Home:
            print("b")
        case .Faverite:
            print("c")
        case .Genres:
            print("b")
        case .Upcoming:
            print("b")
        case .Popular:
            print("b")
        case .Playing:
            print("b")
        default:
            break
        }
    }
}


extension HomeViewController:UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresent = true
        return transiton
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresent = false
        return transiton
    }
}

