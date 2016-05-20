//
//  MainViewController.swift
//  MTKWeiBo
//
//  Created by qfpayJakeMeng on 16/5/20.
//  Copyright © 2016年 mountainKing. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewControllers()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        addCreateWeiboButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 添加所有控制器
    private func addChildViewControllers() {
        tabBar.tintColor = UIColor.orangeColor()
        addChildViewController(HomeTableViewController(), title: "首页", imageName: "tabbar_home",selectedImageName:"tabbar_home_highlighted" )
        addChildViewController(MessageTableViewController(), title: "消息", imageName: "tabbar_message_center",selectedImageName: "tabbar_message_center_highlighted")
        //添加空页面
        addChildViewController(UITableViewController(), title: "", imageName: "",selectedImageName: "")
        
        addChildViewController(DiscoverTableViewController(), title: "发现", imageName: "tabbar_discover",selectedImageName: "tabbar_discover_highlighted")
        addChildViewController(ProfileTableViewController(), title: "我的", imageName: "tabbar_profile",selectedImageName:"tabbar_profile_highlighted")
    }
    
    /// 添加单个子控制器
    private func addChildViewController(vc:UITableViewController,title:String,imageName:String,selectedImageName:String) {
        vc.title = title
        vc.tabBarItem.image = UIImage(named:imageName)
        vc.tabBarItem.selectedImage = UIImage(named:selectedImageName)
        let nv = UINavigationController(rootViewController:vc)
        addChildViewController(nv)
    }
    
    private func addCreateWeiboButton () {
        // 拿到控制器的总数
        let count = childViewControllers.count
        // 计算每个按钮的宽度
        let w = tabBar.bounds.width / CGFloat (count)
        
        let createButton = UIButton()
        createButton.frame = CGRectMake(w * 2, 0, w, tabBar.bounds.height)
        createButton.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        createButton.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        createButton.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        createButton.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        createButton.addTarget(self, action: #selector(MainViewController.createWeibo), forControlEvents: UIControlEvents.TouchUpInside)

        tabBar.addSubview(createButton)
    }
    
   @objc private func createWeibo() {
        NSLog("createWeibo")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
