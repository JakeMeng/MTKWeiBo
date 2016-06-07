//
//  VisitorLoginView.swift
//  MTKWeiBo
//
//  Created by qfpayJakeMeng on 16/6/3.
//  Copyright © 2016年 mountainKing. All rights reserved.
//

import UIKit

class VisitorLoginView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    // MARK: - 界面布局
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    /// - 负责添加和设置 界面位置
    private func setupUI() {
        
        backgroundColor = UIColor.lightGrayColor()
        
        addSubview(self.cricleImageView)
        addSubview(self.coverCricleImageView)
        addSubview(self.smallHouseImageView)
        addSubview(self.notiLabel)
        addSubview(self.registButton)
        addSubview(self.loginButton)
        
        cricleImageView.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint.init(item: cricleImageView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint.init(item: cricleImageView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0))
        
        coverCricleImageView.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint.init(item: coverCricleImageView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: cricleImageView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint.init(item: coverCricleImageView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: cricleImageView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: -10))
        
        smallHouseImageView.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint.init(item: smallHouseImageView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: cricleImageView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint.init(item: smallHouseImageView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: cricleImageView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0))
        
        notiLabel.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint.init(item: notiLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: coverCricleImageView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint.init(item: notiLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 242))
        
        addConstraint(NSLayoutConstraint.init(item: notiLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: coverCricleImageView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 20))
        
        registButton.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint.init(item: registButton, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: notiLabel, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint.init(item: registButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: notiLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 10))
        
        addConstraint(NSLayoutConstraint.init(item: registButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 100))
        
        addConstraint(NSLayoutConstraint.init(item: registButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 30))
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint.init(item: loginButton, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: notiLabel, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint.init(item: loginButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: notiLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 10))
        
        addConstraint(NSLayoutConstraint.init(item: loginButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 100))
        
        addConstraint(NSLayoutConstraint.init(item: loginButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 30))
        
    }
    
    // MARK: - 懒加载控件 -> 负责创建控件
    /// - 小房子
    private lazy var smallHouseImageView = UIImageView.init(image: UIImage.init(named: "visitordiscover_feed_image_house"));
    /// - 圆环图标
    private lazy var cricleImageView = UIImageView.init(image: UIImage.init(named: "visitordiscover_feed_image_smallicon"));
    /// - 遮住圆环图标
    private lazy var coverCricleImageView = UIImageView.init(image: UIImage.init(named: "visitordiscover_feed_mask_smallicon"));
    /// - 消息文字
    private lazy var notiLabel: UILabel = {
        let label = UILabel.init()
        label.text = "登陆后能看到更多的内容, 请您登陆微博后登陆后能看到更多的内容, 请您登陆微博后"
        label.sizeToFit();
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(13)
        label.textColor = UIColor.darkGrayColor()
        label.numberOfLines = 0;
        return label
    }()
    
    /// - 注册按钮
    private lazy var registButton: UIButton = {
       let button = UIButton.init()
        button.setTitle("注册", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage.init(named: "common_button_white_disable"), forState: UIControlState.Normal)
        return button
    }()
    
    /// - 登录按钮
    private lazy var loginButton: UIButton = {
        let button = UIButton.init()
        button.setTitle("登录", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage.init(named: "common_button_white_disable"), forState: UIControlState.Normal)
        return button
    }()
    
}
