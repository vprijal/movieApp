//
//  CollectionViewState.swift
//  Movie
//
//  Created by ITUMAC03 on 18/07/24.
//

import Foundation
import UIKit

enum ICGCollectionViewState {
    case loading
    case done
    case retry
}

extension UICollectionView {

    func updateState(with state: ICGCollectionViewState, completion:(() -> Void)? = nil) {
        var view = UIView(frame: self.bounds)
        switch state {
        case .loading:
            let subview = MLoadingState(frame: view.frame)
            view.addSubview(subview)
            subview.fillSuperView()
            self.backgroundView = view
            completion?()
            return
        case .done:
            self.backgroundView = view
            completion?()
            return
        
        case .retry:
            let subView = RetryView(frame: view.frame)
            view.addSubview(subView)
            subView.fillSuperView()
            self.backgroundView = view
            subView.buttonRetry.action(.touchUpInside) { _ in
                completion?()
            }
        }
    }
    
    func setStateView(with state: ICGCollectionViewState, completion:(() -> Void)? = nil) {
        DispatchQueue.main.async {
            self.updateState(with: state, completion: completion)
        }
    }
}

extension UIControl {

    private static var _actionHandlers = [String:[UInt:((UIControl) -> Void)]]()

    private func getAddressAsString() -> String {
        let addr = Unmanaged.passUnretained(self).toOpaque()
        return "\(addr)"
    }

    private func getHandler(_ event: UIControl.Event) -> ((UIControl) -> Void)? {
        return UIControl._actionHandlers[
            self.getAddressAsString()
        ]?[event.rawValue]
    }
    
    
    func action(_ event: UIControl.Event, _ action:@escaping (UIControl) -> Void) {
        let id = self.getAddressAsString()
        if UIControl._actionHandlers[id] == nil {
            UIControl._actionHandlers[id] = [UInt:((UIControl) -> Void)]()
        }

        UIControl._actionHandlers[id]?[event.rawValue] = action

        switch event {
            case .touchUpInside:
                self.addTarget(self, action: #selector(triggerTouchUpInside), for: event)
                break
            default:
                return;
        }
    }
    
    @objc private func triggerTouchUpInside() {
        getHandler(.touchUpInside)?(self)
    }
}
