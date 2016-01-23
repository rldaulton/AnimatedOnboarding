//
//  OnboardingContentViewController.swift
//  Calendar Loader
//
//  Created by Ryan Daulton on 5/24/15.
//  Copyright (c) 2015 Fade, LLC. All rights reserved.
//

import Foundation
import UIKit
let bounds: CGRect = UIScreen.mainScreen().bounds
let ScreenSize = bounds.size.width

class OnboardingContentViewController: UIViewController {
    let kDefaultOnboardingFont: String = "Helvetica Neue"
    let kDefaultTextColor: UIColor = UIColor.blackColor()
    let kContentWidthMultiplier: CGFloat = 0.9
    let kDefaultImageViewSize: CGFloat = 100
    let kDefaultTopPadding: CGFloat = 30
    let kDefaultUnderIconPadding: CGFloat = 30
    let kDefaultUnderTitlePadding: CGFloat = 30
    let kDefaultBottomPadding: CGFloat = 0;
    let kDefaultTitleFontSize: CGFloat = 38
    let kDefaultBodyFontSize: CGFloat = 28
    let kDefaultActionButtonHeight: CGFloat = 50
    let kDefaultMainPageControlHeight: CGFloat = 35
    let titleText: String
    let body: String
    let image: UIImage
    let buttonText: String
    let action: dispatch_block_t?
    
    var iconSize: CGFloat
    var fontName: String
    var titleFontSize: CGFloat
    var bodyFontSize: CGFloat
    var topPadding: CGFloat
    var underIconPadding: CGFloat
    var underTitlePadding: CGFloat
    var bottomPadding: CGFloat
    var titleTextColor: UIColor
    var bodyTextColor: UIColor
    var buttonTextColor: UIColor
    
    var FlatBlue : UIColor {
        return UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1)
    }
    
    
    init(title: String?, body: String?, image: UIImage?, buttonText: String?, action: dispatch_block_t?) {
        // setup the optional initializer parameters if they were passed in or not
        self.titleText = title != nil ? title! : String()
        self.body = body != nil ? body! : String()
        self.image = image != nil ? image! : UIImage()
        self.buttonText = buttonText != nil ? buttonText! : String()
        self.action = action != nil ? action : {}
        
        // setup the initial default properties
        self.iconSize = kDefaultImageViewSize;
        self.fontName = kDefaultOnboardingFont;
        self.titleFontSize = kDefaultTitleFontSize;
        self.bodyFontSize = kDefaultBodyFontSize;
        self.topPadding = kDefaultTopPadding;
        self.underIconPadding = kDefaultUnderIconPadding;
        self.underTitlePadding = kDefaultUnderTitlePadding;
        self.bottomPadding = kDefaultBottomPadding;
        self.titleTextColor = kDefaultTextColor;
        self.bodyTextColor = kDefaultTextColor;
        self.buttonTextColor = kDefaultTextColor;
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateView()
    }
    override func viewDidDisappear(animated: Bool) {
        
    }
    
    func generateView() {
        
        let blockImages = ["mtnblock","flagblock","bsktballblock"]
        
        let blockImages2 = ["red","orange","yellow","green","blue","indigo","violet"]
        
        if self.titleText == "one" {
            print("Page 1 Generated")
            
            //////////////////////START PAGE 1/////////////////////////////////////////////
            
            ///////// iPHONE BACKImage
            let pickiPhone = UIImage(named: "iPhon6-1")
            let iPhoneBack = UIImageView(image: pickiPhone)
            iPhoneBack.frame = CGRect(x: 0, y: 150, width: bounds.size.width, height: bounds.size.height / 1.5)
            iPhoneBack.contentMode = .ScaleAspectFit
            self.view.addSubview(iPhoneBack)
            
            //////Welcome text
            
            let welcImg = UIImage(named: "Welcome")
            let Welcome = UIImageView(image: welcImg)
            Welcome.frame = CGRect(x: 0, y: 45, width: bounds.size.width, height: bounds.size.height / 7)
            Welcome.contentMode = .ScaleAspectFit
            self.view.addSubview(Welcome)
            
            ///////// Block Animations
            
            print("Screen Width of Device: \(ScreenSize)")
            for i in 0...2 {
                let block = UIImage(named: blockImages[i])
                let block_A = UIImageView(image: block)
                block_A.frame = CGRect(x: bounds.size.width, y: ((bounds.size.height / 1.5) - 75), width: iPhoneBack.frame.size.width - 25, height: 1)
                block_A.contentMode = .ScaleAspectFit
                self.view.addSubview(block_A)
                
                
                if i == 0 {
                    UIView.animateWithDuration(1.0, animations: {
                        
                        if ScreenSize > 414 {
                            
                            block_A.frame = CGRect(x: ((bounds.size.width - (bounds.size.width / 2)) - ((iPhoneBack.image!.size.width / 2)) * 0.3902), y: (iPhoneBack.frame.midY + 35), width: ((iPhoneBack.image!.size.width / 2) * 0.7804), height: (((iPhoneBack.image!.size.width) * 0.7804) * 0.13))
                        }else{
                            block_A.frame = CGRect(x: (((bounds.size.width / 2) - ((bounds.size.width / 2) * 0.5)) + 1), y: (iPhoneBack.frame.midY + 32), width: (bounds.size.width * 0.5) - 1, height: ((bounds.size.width * 0.5) * 0.13))
                            
                        }
                        
                        
                    })
                }
                if i == 1 {
                    UIView.animateWithDuration(2.0, animations: {
                        
                        if ScreenSize > 414 {
                            
                            block_A.frame = CGRect(x: ((bounds.size.width - (bounds.size.width / 2)) - ((iPhoneBack.image!.size.width / 2)) * 0.3902), y: ((iPhoneBack.frame.midY + 35) + (((iPhoneBack.image!.size.width) * 0.7804) * 0.13) - 34), width: ((iPhoneBack.image!.size.width / 2) * 0.7804), height: (((iPhoneBack.image!.size.width) * 0.7804) * 0.13))
                        }else{
                            block_A.frame = CGRect(x: (((bounds.size.width / 2) - ((bounds.size.width / 2) * 0.5)) + 1), y: ((iPhoneBack.frame.midY + 32) + ((bounds.size.width * 0.5) * 0.13) + 1), width: (bounds.size.width * 0.5) - 1, height: ((bounds.size.width * 0.5) * 0.13))
                            
                        }
                    })
                }
                if i == 2 {
                    UIView.animateWithDuration(3.0, animations: {
                        
                        if ScreenSize > 414 {
                            
                            block_A.frame = CGRect(x: ((bounds.size.width - (bounds.size.width / 2)) - ((iPhoneBack.image!.size.width / 2)) * 0.3902), y: ((iPhoneBack.frame.midY + 35) + ((((iPhoneBack.image!.size.width) * 0.7804) * 0.13) * 2) - 68), width: ((iPhoneBack.image!.size.width / 2) * 0.7804), height: (((iPhoneBack.image!.size.width) * 0.7804) * 0.13))
                        }else{
                            block_A.frame = CGRect(x: (((bounds.size.width / 2) - ((bounds.size.width / 2) * 0.5)) + 1), y: ((iPhoneBack.frame.midY + 32) + (((bounds.size.width * 0.5) * 0.13) * 2) + 2), width: (bounds.size.width * 0.5) - 1, height: ((bounds.size.width * 0.5) * 0.13))
                            
                        }
                    })
                }
            }
            ///////// End Block Animations
            var ImagesScreen1 = ["reg_cal","football","basketball","mountain","hunting","goal"]
            
            let width1:CGFloat = bounds.size.width - 12
            
            //////////////// FLY-BY ANIMATIONS
            
            for i in 0...5 {
                //let rand = Double(arc4random_uniform(190)+250) / 10
                let img = UIImage(named: ImagesScreen1[i])
                
                // create a square image at random
                let square = UIImageView(image: img)
                square.frame = CGRect(x: -50, y: 300, width: 24, height: 24)
                
                //  square.backgroundColor = UIColor.redColor()
                self.view.addSubview(square)
                
                
                // randomly create a value between 0.0 and 150.0
                let randomYOffset = CGFloat( arc4random_uniform(90))
                
                // for every y-value on the bezier curve
                // add our random y offset so that each individual animation
                // will appear at a different y-position
                let path = UIBezierPath()
                path.moveToPoint(CGPoint(x: -10,y: (bounds.size.height - (bounds.size.height * 0.25)) + randomYOffset))
                path.addCurveToPoint(CGPoint(x: width1, y: (bounds.size.height - (bounds.size.height * 0.25)) + randomYOffset), controlPoint1: CGPoint(x: (bounds.size.width * 0.33), y: 134 + (bounds.size.height - (bounds.size.height * 0.25)) + randomYOffset), controlPoint2: CGPoint(x: (bounds.size.width * 0.66), y:(bounds.size.height - (bounds.size.height * 0.25)) - 129 + randomYOffset))
                
                // create the animation
                let anim = CAKeyframeAnimation(keyPath: "position")
                anim.path = path.CGPath
                anim.rotationMode = kCAAnimationRotateAuto
                anim.repeatCount = Float.infinity
                anim.duration = 5.0
                
                // each square will take between 4.0 and 8.0 seconds
                // to complete one animation loop
                anim.duration = Double(arc4random_uniform(40)+30) / 10
                
                // stagger each animation by a random value
                // `290` was chosen simply by experimentation
                anim.timeOffset = Double(arc4random_uniform(290))
                
                // add the animation
                square.layer.addAnimation(anim, forKey: "animate position along path")
            }
            //////////////// End FLY-BY
            
            ////////////////////////END PAGE 1////////////////////////////////////////////////
        }
        if self.titleText == "two" {
            print("Page 2 Generated")
            ////////////////////////START PAGE 2///////////////////////////////////////////////
            var icons = ["sportsicon","recreationicon","customicon"]
            ///////// iPHONE BACKGImage 2
            let pickiPhone2 = UIImage(named: "iPhoneScreen2")
            let iPhoneBack2 = UIImageView(image: pickiPhone2)
            iPhoneBack2.frame = CGRect(x: 0, y: 150, width: bounds.size.width, height: bounds.size.height / 1.5)
            iPhoneBack2.contentMode = .ScaleAspectFit
            self.view.addSubview(iPhoneBack2)
            
            //////"Choose" text
            
            let welcImg2 = UIImage(named: "Choose")
            let Welcome2 = UIImageView(image: welcImg2)
            Welcome2.frame = CGRect(x: 0, y: 45, width: bounds.size.width, height: bounds.size.height / 7)
            Welcome2.contentMode = .ScaleAspectFit
            self.view.addSubview(Welcome2)
            ////////Category Icons
            for i in 0...2 {
                
                let icon1 = UIImage(named: icons[i])
                let icon1place = UIImageView(image:icon1)
                icon1place.frame = CGRect(x: (bounds.size.width * 0.33) - (bounds.size.width * 0.166), y: 45 + (bounds.size.height / 7) + 6, width: (bounds.size.width * 0.166), height: (bounds.size.width * 0.166))
                icon1place.contentMode = .ScaleAspectFit
                self.view.addSubview(icon1place)
                
                if i == 1 {
                    icon1place.frame = CGRect(x: ((bounds.size.width * 0.33) - (bounds.size.width * 0.166)) + ((bounds.size.width * 0.49) * 0.5), y: 45 + (bounds.size.height / 7) + 6, width: (bounds.size.width * 0.166), height: (bounds.size.width * 0.166))
                }
                if i == 2 {
                    icon1place.frame = CGRect(x: ((bounds.size.width * 0.33) - (bounds.size.width * 0.166)) + ((bounds.size.width * 0.988) * 0.5), y: 45 + (bounds.size.height / 7) + 6, width: (bounds.size.width * 0.166), height: (bounds.size.width * 0.166))
                }
            }
            
            ///////iPhone Screen animations page 2
            let options = UIViewAnimationOptions.Repeat
            
            
            var xPos: CGFloat = 0
            if ScreenSize > 414 {
                xPos = ((bounds.size.width - (bounds.size.width / 2)) - ((iPhoneBack2.image!.size.width / 2)) * 0.2202)
            }else{
                xPos = (((bounds.size.width / 2) - ((bounds.size.width / 2) * 0.46)) + 1)
            }
            
            
            for i in 0...6 {
                let blockB = UIImage(named: blockImages2[i])
                let block_B = UIImageView(image: blockB)
                block_B.frame = CGRect(x: bounds.size.width / 17, y: (bounds.size.height), width: iPhoneBack2.frame.size.width - 25, height: 25)
                block_B.contentMode = .ScaleAspectFit
                self.view.addSubview(block_B)
                
                //first one is right, others need adjustment
                
                if i == 0 {
                    UIView.animateWithDuration(1.5, animations: { () -> Void in
                        
                        if ScreenSize > 414 {
                            
                            block_B.frame = CGRect(x: ((bounds.size.width - (bounds.size.width / 2)) - ((iPhoneBack2.image!.size.width / 2)) * 0.2202), y: (iPhoneBack2.frame.midY - 120), width: ((iPhoneBack2.image!.size.width / 2) * 0.444), height: (((iPhoneBack2.image!.size.width) * 0.444) * 0.13))
                        }else{
                            block_B.frame = CGRect(x: (((bounds.size.width / 2) - ((bounds.size.width / 2) * 0.46)) + 1), y: (iPhoneBack2.frame.midY - 52), width: (bounds.size.width * 0.46), height: ((bounds.size.width * 0.46) * 0.13))
                            
                        }
                        
                        
                        }, completion: nil)
                }
                if i == 1 {
                    UIView.animateWithDuration(1.6, animations: { () -> Void in
                        
                        if ScreenSize > 414 {
                            
                            block_B.frame = CGRect(x: ((bounds.size.width - (bounds.size.width / 2)) - ((iPhoneBack2.image!.size.width / 2)) * 0.2202), y: ((iPhoneBack2.frame.midY - 120) + (((iPhoneBack2.image!.size.width) * 0.444) * 0.13)) + 1, width: ((iPhoneBack2.image!.size.width / 2) * 0.444), height: (((iPhoneBack2.image!.size.width) * 0.444) * 0.13))
                        }else{
                            block_B.frame = CGRect(x: (((bounds.size.width / 2) - ((bounds.size.width / 2) * 0.46)) + 1), y: ((iPhoneBack2.frame.midY - 52) + (1 * ((bounds.size.width * 0.46) * 0.13)) + 2), width: (bounds.size.width * 0.46), height: ((bounds.size.width * 0.46) * 0.13))
                            
                        }
                        }, completion: nil)
                }
                if i == 2 {
                    UIView.animateWithDuration(1.7, animations: { () -> Void in
                        
                        if ScreenSize > 414 {
                            
                            block_B.frame = CGRect(x: ((bounds.size.width - (bounds.size.width / 2)) - ((iPhoneBack2.image!.size.width / 2)) * 0.2202), y: ((iPhoneBack2.frame.midY - 120) + (2 * ((iPhoneBack2.image!.size.width) * 0.444) * 0.13)) + 2, width: ((iPhoneBack2.image!.size.width / 2) * 0.444), height: (((iPhoneBack2.image!.size.width) * 0.444) * 0.13))
                        }else{
                            block_B.frame = CGRect(x: (((bounds.size.width / 2) - ((bounds.size.width / 2) * 0.46)) + 1), y: ((iPhoneBack2.frame.midY - 52) + (2 * ((bounds.size.width * 0.46) * 0.13)) + 4), width: (bounds.size.width * 0.46), height: ((bounds.size.width * 0.46) * 0.13))
                            
                        }
                        }, completion: nil)
                }
                if i == 3 {
                    UIView.animateWithDuration(1.8, animations: { () -> Void in
                        
                        if ScreenSize > 414 {
                            
                            block_B.frame = CGRect(x: ((bounds.size.width - (bounds.size.width / 2)) - ((iPhoneBack2.image!.size.width / 2)) * 0.2202), y: ((iPhoneBack2.frame.midY - 120) + (3 * ((iPhoneBack2.image!.size.width) * 0.444) * 0.13)) + 3, width: ((iPhoneBack2.image!.size.width / 2) * 0.444), height: (((iPhoneBack2.image!.size.width) * 0.444) * 0.13))
                        }else{
                            block_B.frame = CGRect(x: (((bounds.size.width / 2) - ((bounds.size.width / 2) * 0.46)) + 1), y: ((iPhoneBack2.frame.midY - 52) + (3 * ((bounds.size.width * 0.46) * 0.13)) + 6), width: (bounds.size.width * 0.46), height: ((bounds.size.width * 0.46) * 0.13))
                            
                        }
                        }, completion: nil)
                }
                if i == 4 {
                    UIView.animateWithDuration(1.9, animations: { () -> Void in
                        
                        if ScreenSize > 414 {
                            
                            block_B.frame = CGRect(x: ((bounds.size.width - (bounds.size.width / 2)) - ((iPhoneBack2.image!.size.width / 2)) * 0.2202), y: ((iPhoneBack2.frame.midY - 120) + (4 * ((iPhoneBack2.image!.size.width) * 0.444) * 0.13)) + 4, width: ((iPhoneBack2.image!.size.width / 2) * 0.444), height: (((iPhoneBack2.image!.size.width) * 0.444) * 0.13))
                        }else{
                            block_B.frame = CGRect(x: (((bounds.size.width / 2) - ((bounds.size.width / 2) * 0.46)) + 1), y: ((iPhoneBack2.frame.midY - 52) + (4 * ((bounds.size.width * 0.46) * 0.13)) + 8), width: (bounds.size.width * 0.46), height: ((bounds.size.width * 0.46) * 0.13))
                            
                        }
                        }, completion: nil)
                }
                if i == 5 {
                    UIView.animateWithDuration(2.0, animations: { () -> Void in
                        
                        if ScreenSize > 414 {
                            
                            block_B.frame = CGRect(x: ((bounds.size.width - (bounds.size.width / 2)) - ((iPhoneBack2.image!.size.width / 2)) * 0.2202), y: ((iPhoneBack2.frame.midY - 120) + (5 * ((iPhoneBack2.image!.size.width) * 0.444) * 0.13)) + 5, width: ((iPhoneBack2.image!.size.width / 2) * 0.444), height: (((iPhoneBack2.image!.size.width) * 0.444) * 0.13))
                        }else{
                            block_B.frame = CGRect(x: (((bounds.size.width / 2) - ((bounds.size.width / 2) * 0.46)) + 1), y: ((iPhoneBack2.frame.midY - 52) + (5 * ((bounds.size.width * 0.46) * 0.13)) + 10), width: (bounds.size.width * 0.46), height: ((bounds.size.width * 0.46) * 0.13))
                            
                        }
                        }, completion: nil)
                }
                if i == 6 {
                    UIView.animateWithDuration(2.1, animations: { () -> Void in
                        
                        if ScreenSize > 414 {
                            
                            block_B.frame = CGRect(x: ((bounds.size.width - (bounds.size.width / 2)) - ((iPhoneBack2.image!.size.width / 2)) * 0.2202), y: ((iPhoneBack2.frame.midY - 120) + (6 * ((iPhoneBack2.image!.size.width) * 0.444) * 0.13)) + 6, width: ((iPhoneBack2.image!.size.width / 2) * 0.444), height: (((iPhoneBack2.image!.size.width) * 0.444) * 0.13))
                        }else{
                            block_B.frame = CGRect(x: (((bounds.size.width / 2) - ((bounds.size.width / 2) * 0.46)) + 1), y: ((iPhoneBack2.frame.midY - 52) + (6 * ((bounds.size.width * 0.46) * 0.13)) + 12), width: (bounds.size.width * 0.46), height: ((bounds.size.width * 0.46) * 0.13))
                            
                        }
                        }, completion: nil)
                }
            }
            
            if ScreenSize > 414 {
                
                let fade1 = UIImage(named: "fadeCover")
                let fadeCover = UIImageView(image:fade1)
                fadeCover.frame = CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height)
                //fadeCover.contentMode = .ScaleAspectFill
                self.view.addSubview(fadeCover)
            }
            //////////////////////////END PAGE 2////////////////////////////////////////////////
        }
        if self.titleText == "three" {
            
            print("Page 3 Generated")
            ////////////////////////START PAGE 3///////////////////////////////////////////////
            
            ///////// iPHONE BACKGImage 2
            let pickiPhone3 = UIImage(named: "calendarUpToDate")
            let iPhoneBack3 = UIImageView(image: pickiPhone3)
            iPhoneBack3.frame = CGRect(x: bounds.size.width / 8, y: 150, width: bounds.size.width - (2 * (bounds.size.width / 8)), height: bounds.size.height / 1.2)
            iPhoneBack3.contentMode = .ScaleAspectFit
            self.view.addSubview(iPhoneBack3)
            
            /////Get Row
            let GetImage = UIImage(named: "GetExample")
            let Get = UIImageView(image: GetImage)
            Get.frame = CGRect(x: bounds.size.width / 9, y: 125, width: bounds.size.width - (2 * (bounds.size.width / 9)), height: bounds.size.height / 8)
            Get.contentMode = .ScaleAspectFit
            self.view.addSubview(Get)
            
            //////"Current" text
            
            let welcImg3 = UIImage(named: "Current")
            let Welcome3 = UIImageView(image: welcImg3)
            Welcome3.frame = CGRect(x: 0, y: 45, width: bounds.size.width, height: bounds.size.height / 7)
            Welcome3.contentMode = .ScaleAspectFit
            self.view.addSubview(Welcome3)
            //////////////////////////END PAGE 3////////////////////////////////////////////////
        }
        if self.titleText == "four" {
            /////////////////////////START PAGE 4////////////////////////
            
            ///////// iPHONE BACKGImage 4
            let pickiPhone4 = UIImage(named: "syncAcross")
            let iPhoneBack4 = UIImageView(image: pickiPhone4)
            iPhoneBack4.frame = CGRect(x: 0, y: 150, width: bounds.size.width, height: bounds.size.height / 2)
            iPhoneBack4.contentMode = .ScaleAspectFit
            self.view.addSubview(iPhoneBack4)
            
            //////"Sync" text
            
            let welcImg4 = UIImage(named: "Sync")
            let Welcome4 = UIImageView(image: welcImg4)
            Welcome4.frame = CGRect(x: 0, y: 45, width: bounds.size.width, height: bounds.size.height / 7)
            Welcome4.contentMode = .ScaleAspectFit
            self.view.addSubview(Welcome4)
            
            /////////////////END PAGE 4/////////////////////////////////
        }
        
                let viewWidth: CGFloat = CGRectGetWidth(self.view.frame)
        let contentWidth: CGFloat = viewWidth * kContentWidthMultiplier
        if (self.buttonText.characters.count != 0) {
            let actionButton: UIButton = UIButton(frame: CGRectMake((CGRectGetMaxX(self.view.frame) / 2) - (contentWidth / 2), CGRectGetMaxY(self.view.frame) - kDefaultMainPageControlHeight - kDefaultActionButtonHeight - self.bottomPadding, contentWidth, kDefaultActionButtonHeight))
            actionButton.titleLabel?.font = UIFont .systemFontOfSize(20)
            actionButton.setTitle(self.buttonText, forState: .Normal)
            actionButton.backgroundColor = FlatBlue
            actionButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            actionButton.addTarget(self, action: "handleButtonPressed", forControlEvents: .TouchUpInside)
            self.view.addSubview(actionButton)
        }
    }
    
    func handleButtonPressed() {
        self.action!()
    }
    
}