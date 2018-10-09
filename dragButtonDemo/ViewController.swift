//
//  ViewController.swift
//  dragButtonDemo
//
//  Created by DerekYang on 2018/10/9.
//  Copyright © 2018年 DKY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var m_closeBtn: DragButton? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupCloseBtn()
    }
    
    func setupCloseBtn()
    {
        self.m_closeBtn = DragButton(frame: CGRect.zero)
        
        if let btn = self.m_closeBtn {
            btn.setTitle("click me", for: .normal)
            btn.backgroundColor = UIColor.blue
            btn.clickClosure = {
                [weak self]
                (btn) in
                //单击回调
                self?.clickClose(sender: btn)
            }
            self.view.addSubview(btn)
            btn.translatesAutoresizingMaskIntoConstraints = false
            if #available(iOS 11.0, *) {
                btn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
                //                btn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
                btn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
                //                btn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            } else {
                // Fallback on earlier versions
                self.edgesForExtendedLayout = []
                
                btn.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
                //                btn.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
                btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
                //                btn.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            }
            btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
            btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
    }
    
    @objc func clickClose(sender: UIButton)
    {
        print("close")
    }

}

