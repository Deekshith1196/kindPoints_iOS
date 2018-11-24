//
//  RegistrationViewController.swift
//  kindPoints
//
//  Created by Deekshith Maram on 10/24/18.
//  Copyright © 2018 Deekshith Maram. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var firstNameView: UIView!
    @IBOutlet weak var secondNameView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var rePasswordView: UIView!
    @IBOutlet weak var firstNameLbl: UILabel!
    @IBOutlet weak var firstNameTf: UITextField!
    
    @IBOutlet weak var lastNameTf: UITextField!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var emailTf: UITextField!
    
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var rePasswordLbl: UILabel!
    @IBOutlet weak var rePasswordTf: UITextField!
    
    @IBOutlet weak var checkBoxBtn: UIButton!
    
    @IBOutlet weak var createAccountBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewShadow(view: view2)
        viewShadow(view: createAccountBtn)
        createAccountBtn.layer.cornerRadius = 20
        
        firstNameView.layer.addBorder(edge: .bottom, color: UIColor.gray, thickness: 0.5)
        emailView.layer.addBorder(edge: .bottom, color: UIColor.gray, thickness: 0.5)
        passwordView.layer.addBorder(edge: .bottom, color: UIColor.gray, thickness: 0.5)
    
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func goToLogin(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let loginVC = storyBoard.instantiateViewController(withIdentifier: "loginVC") as! LoginViewController
        self.present(loginVC, animated:true, completion:nil)
    }
    
}

extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer();
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x:0, y:self.frame.height - thickness, width:self.frame.width, height:thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x:0, y:0, width: thickness, height: self.frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x:self.frame.width - thickness, y: 0, width: thickness, height:self.frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
    }
    
}
