//
//  MenuViewController.swift
//  Navigation
//
//  Created by Vương Toàn Bắc on 5/28/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import UIKit

enum MenuType:Int{
    case Profile
    case Home
    case Faverite
    case Genres
    case Upcoming
    case Popular
    case Playing
}

class MenuViewController: UITableViewController {
    
    var didTapMenuType: ((MenuType) -> Void)?
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard  let menuType = MenuType(rawValue: indexPath.row) else {return}
        dismiss(animated: true) { [weak self] in
            print("dismiss \(menuType)")
            self?.didTapMenuType?(menuType)
        }
    }

}
