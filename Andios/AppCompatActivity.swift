//
//  AndiosActivity.swift
//  iosdemo
//
//  Created by typark on 2018. 3. 2..
//  Copyright © 2018년 typark. All rights reserved.
//

import UIKit

open class AppCompatActivity: UIViewController, Context {

    public var theme: Theme?

    public var menu: Menu = Menu();
    
    public var intent: Intent?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.onCreate()
    }
    
    open func onCreate() {
        onCreateOptionsMenu(self.menu);
        
        if let theme = self.theme {
            if let nc = self.navigationController {
                if(theme.windowNoTitle == true) {
                    if(theme.colorPrimary.id.value == "") {
                        let hex = theme.colorPrimary.value
                        let red = CGFloat((hex >> 16) & 0xff)/255.0
                        let green = CGFloat((hex >> 8) & 0xff)/255.0
                        let blue = CGFloat(hex & 0xff)/255.0
                        nc.navigationBar.barTintColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
                    } else {
                        nc.navigationBar.barTintColor = UIColor(named: theme.colorPrimary.id.value);
                    }
                }
            }
            
            self.view.backgroundColor = ContextCompat.getColor(theme.windowBackground)
        }
        
        for menuItem in self.menu.menuItems {
            addMenuItemButton(menuItem)
        }
    }
    
    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    open func startActivity(_ intent: Intent) {
        
        var navigationBar = true;
        
        if let theme = intent.targetActivity.theme {
            if theme.windowFullscreen {
                navigationBar = false;
            } else {
                navigationBar = theme.navigationBar
            }
        } else {
            navigationBar = false
        }
        
        if navigationBar {
            let vc = UINavigationController(rootViewController: intent.targetActivity)
            Assert.assertNotNull(intent.targetActivity.intent)
            if let activity = intent.sourceActivity {
                activity.present(vc, animated: true, completion: nil)
            } else {
                self.presentRootViewController(vc, animated: true)
            }
        } else {
            let vc = intent.targetActivity
            Assert.assertNotNull(intent.targetActivity.intent)
            
            if let activity = intent.sourceActivity {
                activity.present(vc, animated: true, completion: nil)
            } else {
                self.presentRootViewController(vc, animated: true)
            }
        }
    }
    
    private func presentRootViewController(_ rootViewController: UIViewController, animated: Bool) {
        
        self.view.endEditing(true)
        
        if(UIApplication.shared.delegate!.window == nil) {
            Logger.d("UIApplication.shared.keyWindow is nil")
        }
        
        if animated {
            UIView.transition(with: UIApplication.shared.delegate!.window!!, duration: 0.5, options: .transitionCrossDissolve, animations: {
                let oldState: Bool = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                UIApplication.shared.delegate!.window!?.rootViewController = rootViewController
                UIView.setAnimationsEnabled(oldState)
            }, completion: { (finished: Bool) -> () in
                // do nothing.
            })
        } else {
            UIApplication.shared.delegate!.window!?.rootViewController = rootViewController
        }
    }
    
    open func setTitle(_ title: String, _ color: UIColor = UIColor.white)
    {
        let label = UILabel()
        label.text = title
        label.sizeToFit()
        label.textColor = color
        self.navigationItem.titleView = label
    }
    
    open func setTheme(_ theme: Theme) {
        self.theme = theme;
    }

    open func onCreateOptionsMenu(_ menu: Menu) {
        
    }
    
    open func onOptionsItemSelected(_ item: MenuItem) {
        
    }
    
    open func getMenuInflater() -> MenuInflater {
        return MenuInflater()
    }
    
    lazy var actionBar: ActionBar = {
        return ActionBar(self)
    }()
    
    public func getSupportActionBar() -> ActionBar {
        return self.actionBar
    }
    
    public func getActivity() -> AppCompatActivity {
        return self
    }
    
    public func setHomeAsUpIndicator(_ drawable: R.ResId) {
        if self.navigationController != nil {
            let image = UIImage(named: drawable.value)?.withRenderingMode(.alwaysOriginal)
            let icon = UIBarButtonItem(image: image, style:UIBarButtonItemStyle.plain, target: self, action: #selector(onToolbar_home(sender:)))
            self.navigationItem.leftBarButtonItems = [icon]
        }
    }
    
    @objc private func onToolbar_home(sender: UIBarButtonItem) {
        let item = MenuItem(R.android.id.home, "")
        onOptionsItemSelected(item)
    }

    private var rightBarButtonItems: [UIBarButtonItem] = []
    
    func addMenuItemButton(_ menuItem: MenuItem)
    {
        if self.navigationController != nil {
            let image = UIImage(named: menuItem.drawable.value)?.withRenderingMode(.alwaysOriginal)
            let icon = UIBarButtonItem(image: image, style:UIBarButtonItemStyle.plain, target: self, action: #selector(onToolbar_right(sender:)))
            icon.tag = menuItem.actionId
            self.rightBarButtonItems.append(icon)
            self.navigationItem.rightBarButtonItems = self.rightBarButtonItems
        }
    }
    
    @objc private func onToolbar_right(sender: UIBarButtonItem) {
        let item = MenuItem(sender.tag, "")
        onOptionsItemSelected(item)
    }
    
    open func finish() {
        self.dismiss(animated: true, completion: nil)
    }
}
