//
//  ViewController.swift
//  DOTOnBoard
//
//  Created by DioGnDev on 11/29/2018.
//  Copyright (c) 2018 DioGnDev. All rights reserved.
//

import UIKit
import DOTOnBoard

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var child = OnBoardViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildVC(child)
        child.delegate = self
        child.setup(setScrollView: scrollView)
        child.addContent(imageName: "", title: "Update Harga & Transparan", description: "Harga selalu update dengan perkembangan pasar dan transparan")
        child.addContent(imageName: "", title: "Kualitas Terjamin", description: "Jaminan barang terbaik dan standar yang sudah teruji")
        child.addContent(imageName: "", title: "Transportasi", description: "Penjemputan dan pengantaran sampai ketempat anda")
        
    }
    
}

extension UIViewController: OnBoardDelegate {
    
    public func didStart() {
        print("ke klik")
    }
}

extension UIViewController {
    func addChildVC(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func remove(){
        guard parent != nil else {return}
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}
