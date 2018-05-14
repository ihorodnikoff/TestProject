//
//  RepositoryDetailsViewController.swift
//  Rentberry
//
//  Created by i.horodnikov on 13/05/2018.
//  Copyright © 2018 Rentberry. All rights reserved.
//

import UIKit
import WebKit

class RepositoryDetailsViewController: UIViewController {

  @IBOutlet weak var webView: WKWebView!
  
  // MARK: - Injected

  var output: RepositoryDetailsViewOutput!
  
  //MARK: - Properties
  
  var initialTouchPoint: CGPoint = CGPoint(x: 0, y: 0)
  var initialOrigin = CGPoint.zero

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    output.viewIsReady()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    initialOrigin = view.frame.origin
  }
  
  //MARK: - Actions
  
  @IBAction func closeDidTap(_ sender: UIButton) {
    output.dismissView()
  }

  @IBAction func panGestureRecognizerHandler(_ sender: UIPanGestureRecognizer) {
    let touchPoint = sender.location(in: self.view?.window)
    
    switch sender.state {
    case .began:
      initialTouchPoint = touchPoint
    case .changed:
      let distance = touchPoint.y - initialTouchPoint.y
      if distance > 0 {
        view.frame.origin.y = initialOrigin.y + distance
      }
    case .ended, .cancelled:
      if touchPoint.y - initialTouchPoint.y > 100 {
        output.dismissView()
      } else {
        UIView.animate(withDuration: 0.3, animations: {
          self.view.frame.origin = self.initialOrigin
        })
      }
    default:
      break
    }
  }
  
}

// MARK: - RepositoryDetailsViewInput

extension RepositoryDetailsViewController: RepositoryDetailsViewInput {
  func configure(with url: URL) {
    let request = URLRequest(url: url)
    webView.load(request)
  }
  
  func dismiss() {
    dismiss(animated: true, completion: nil)
  }
}
