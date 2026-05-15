//
//  MainView.swift
//  Zoo
//
//  Created by christian landa on 12/1/23.
//

import SwiftUI

private enum ZooTab: Hashable {
    case animals
    case classes
    case map
    case workers
}

struct MainView: View {
    @State private var selectedTab: ZooTab = .animals
    @State private var animalNavigationPath: [Int] = []

    private var tabSelection: Binding<ZooTab> {
        Binding(
            get: { selectedTab },
            set: { newTab in
                if newTab == .animals {
                    resetAnimalTab()
                }

                selectedTab = newTab
            }
        )
    }

    var body: some View {
        TabView(selection: tabSelection) {
            ContentView(navigationPath: $animalNavigationPath)
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Animals")
                }
                .tag(ZooTab.animals)
            
            ClassesContentView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Mammals")
                }
                .tag(ZooTab.classes)
            
        

            ZooMapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
                .tag(ZooTab.map)
            
            ZooKeeperView()
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Workers")
                }
                .tag(ZooTab.workers)
        }
        .zooScreenStyle()
        .background(TabBarReselectObserver())
        .onChange(of: selectedTab) { _, newTab in
            if newTab == .animals {
                resetAnimalTab()
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: .zooTabBarReselected)) { notification in
            guard let selectedIndex = notification.object as? Int, selectedIndex == 0 else { return }
            resetAnimalTab()
        }
    }

    private func resetAnimalTab() {
        animalNavigationPath.removeAll()
    }
}

private struct TabBarReselectObserver: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()

        DispatchQueue.main.async {
            viewController.tabBarController?.delegate = context.coordinator
        }

        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        DispatchQueue.main.async {
            uiViewController.tabBarController?.delegate = context.coordinator
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    final class Coordinator: NSObject, UITabBarControllerDelegate {
        func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            if tabBarController.selectedViewController == viewController,
               let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController) {
                NotificationCenter.default.post(name: .zooTabBarReselected, object: selectedIndex)
            }

            return true
        }
    }
}

private extension Notification.Name {
    static let zooTabBarReselected = Notification.Name("zooTabBarReselected")
}

#Preview {
    MainView()
}
