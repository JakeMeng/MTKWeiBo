//
//  BaseTableViewController.swift
//  MTKWeiBo
//
//  Created by qfpayJakeMeng on 16/5/20.
//  Copyright © 2016年 mountainKing. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    
    var userLogin = false
    
    override func loadView() {
        userLogin ? super.loadView() : setupVistorView()
    }
    
    private func setupVistorView() {
        //替换根视图
        view = UIView()
        view.backgroundColor = UIColor.orangeColor()
        
        //设置导航按钮
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title:"注册", style: UIBarButtonItemStyle.Plain, target:nil, action:nil)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登陆", style: UIBarButtonItemStyle.Plain,target:nil, action: nil)
    }

}
