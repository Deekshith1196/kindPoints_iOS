//
//  LoginViewController.swift
//  kindPoints
//
//  Created by Deekshith Maram on 10/24/18.
//  Copyright © 2018 Deekshith Maram. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FacebookLogin
import TwitterKit

class LoginViewController: UIViewController {
   
    var dict : [String : AnyObject]!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var emailImgView: UIImageView!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var passwordImgView: UIImageView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var instagramImgView: UIImageView!
    
    @IBOutlet weak var twitterImgView: UIImageView!
    @IBOutlet weak var fbImgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewShadow(view: view1)
        emailView.layer.addBorder(edge: .bottom, color: UIColor.gray, thickness: 0.5)
        loginBtn.layer.cornerRadius = 25.0
        

        
        if let accessToken = FBSDKAccessToken.current(){
            getFBUserData()
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(fbLogin(gesture:)))
        fbImgView.addGestureRecognizer(tap)
        fbImgView.isUserInteractionEnabled = true
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(igLogin(gesture:)))
         instagramImgView.addGestureRecognizer(tap1)
         instagramImgView.isUserInteractionEnabled = true
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(twitterLogin(gesture:)))
        twitterImgView.addGestureRecognizer(tap2)
        twitterImgView.isUserInteractionEnabled = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToRegister(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let registerVC = storyBoard.instantiateViewController(withIdentifier: "registrationVC") as! RegistrationViewController
        self.present(registerVC, animated:true, completion:nil)
    }
    
  @objc func fbLogin(gesture: UITapGestureRecognizer){
         print("hello")
    let loginManager = LoginManager()
    loginManager.logIn(readPermissions: [.publicProfile, .email], viewController : self) { loginResult in
        switch loginResult {
        case .failed(let error):
            print(error)
        case .cancelled:
            print("User cancelled login")
        case .success(let grantedPermissions, let declinedPermissions, let accessToken):
            print("Logged in")
            self.getFBUserData()
        }
    }
    }
    
    
   @objc func igLogin(gesture: UITapGestureRecognizer){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let igVC = storyBoard.instantiateViewController(withIdentifier: "instagramVC") as! InstagramLoginViewController
        self.present(igVC, animated:true, completion:nil)
    }
    
    @objc func twitterLogin(gesture: UITapGestureRecognizer){
        TWTRTwitter.sharedInstance().logIn(completion: { (session, error) in
            if (session != nil) {
                print("signed in as (String(describing: session?.userName))");
            } else {
                print("error: \(error?.localizedDescription)")
              //  print("error: (String(describing: error?.localizedDescription))")
            }
        })
    }
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    print(result!)
                    print(self.dict)
                }
            })
        }
    }
    
    
    
    
}
