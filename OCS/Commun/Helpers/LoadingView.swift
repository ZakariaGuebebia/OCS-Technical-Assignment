//
//  LoadingView.swift
//  OCS
//
//  Created by Zakaria on 8/12/2021.
//

import UIKit
import Lottie

class LoadingView: UIView {

    let animationView = AnimationView()

    override init(frame: CGRect) {

        super.init(frame: frame)

        self.backgroundColor = UIColor.black.withAlphaComponent(0.05)

        let  animationFileName: String = "OCSLoader"

        let animation = Animation.named(animationFileName)
        animationView.animation = animation
        animationView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        animationView.center = self.center
        animationView.play()
        animationView.play(fromProgress: 0, toProgress: 1, loopMode: LottieLoopMode.loop) { (_) in
        }

        self.addSubview(animationView)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

var ActivityIndicatorViewInSuperviewAssociatedObjectKey = "_UIViewActivityIndicatorViewInSuperviewAssociatedObjectKey"

func showActivityIndicator() {

    let loadingView = LoadingView(frame: UIScreen.main.bounds)
    UIApplication.topViewController()?.view.addSubview(loadingView)

    objc_setAssociatedObject(UIApplication.topViewController()!, &ActivityIndicatorViewInSuperviewAssociatedObjectKey, loadingView, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
}
func hideActivityIndicator() {

    if let ActivityIndicatory = objc_getAssociatedObject(UIApplication.topViewController() as Any, &ActivityIndicatorViewInSuperviewAssociatedObjectKey) {

        (ActivityIndicatory as AnyObject).removeFromSuperview()

    }
}
let rootViewController = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .compactMap({$0 as? UIWindowScene})
        .first?.windows
        .filter({$0.isKeyWindow}).first?.rootViewController

extension UIApplication {
    class func topViewController(base: UIViewController? = rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }

        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }

        return base
    }
    
}
