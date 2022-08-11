//
//  SceneDelegate.swift
//  Foodie
//
//  Created by Apple on 10.08.2022.
//

import UIKit
import CoreData
import CoreLocation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let coreData = CoreDataStack()
    private let foodieService = FoodieService.shared
    private var managedObjectContext: NSManagedObjectContext?
    private var locationManager: CLLocationManager?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        foodieService.managedObjectContext = coreData.persistentContainer.viewContext
        
        LocationService.shared.locationUpdateHandler = { [weak self] (needUpdate: Bool, userLocation: CLLocation?) in
            if needUpdate {
                self?.foodieService.loadRestaurants(around: userLocation, completionHandler: nil)
            }
        }
        LocationService.shared.findUserLocation()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        coreData.saveContext()
    }


}

