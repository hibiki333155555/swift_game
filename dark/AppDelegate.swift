import UIKit

@UIApplicationMain
class AppDelegate: NSObject, UIApplicationDelegate {
    // 回転可能か設定する。外部から変更できるよう静的としている
    /*
        ・回転許可：UIInterfaceOrientationMask.all
        ・縦固定　：UIInterfaceOrientationMask.partrait
        ・横固定　：UIInterfaceOrientationMask.landscape
        ・その他　：https://developer.apple.com/documentation/uikit/uiinterfaceorientationmask/
    */
    static var orientationLock = UIInterfaceOrientationMask.landscape
    // 設定の変更通知がされた時に呼ばれるデリゲート
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}


