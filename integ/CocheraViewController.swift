//
//  CocheraViewController.swift
//  integ
//
//  Created by Diseno on 25/03/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import UIKit
import Alamofire
import Starscream

class CocheraViewController: UIViewController,WebSocketDelegate {
    
    @IBOutlet weak var abrir: UIButton!
    @IBOutlet weak var cerrar: UIButton!
    var socket: WebSocket!
    var isConnected = true
    let server = WebSocketServer()
    override func viewDidLoad() {
        abrir.round()
        cerrar.round()
        var request = URLRequest(url: URL(string: "ws://54.146.120.131:3333/adonis-ws")!)
        request.timeoutInterval = 5
        socket = WebSocket(request: request)
        socket.delegate = self
        socket.connect()
                }
   func didReceive(event: WebSocketEvent, client: WebSocket) {
        switch event {
        case .connected(let headers):
            isConnected = true
            socket.write(string: "{\"t\":\(1),\"d\":{\"topic\":\"wscochera\"}}")
            print("websocket is connected: \(headers)")
        case .disconnected(let reason, let code):
            isConnected = false
            print("websocket is disconnected: \(reason) with code: \(code)")
        case .text(let string):
            print("Received text: \(string)")
        case .binary(let data):
            print("Received data: \(data.count)")
        case .ping(_):
            break
        case .pong(_):
            break
        case .viabilityChanged(_):
            break
        case .reconnectSuggested(_):
            break
        case .cancelled:
            isConnected = false
        case .error(let error):
            isConnected = false
            handleError(error)
        }
    }
    func handleError(_ error: Error?) {
        if let e = error as? WSError{
            print("websocket en error : \(e.message)")
        }
        else if let e = error{
            print("websocket en error : \(e.localizedDescription)")
        }
        else{
            print("websocket en error")
        }
    }
    @IBAction func btnOpen(_ sender: Any) {
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "Abrir", message: nil, preferredStyle: .actionSheet)
        let FourActionButton = UIAlertAction(title: "Abriendo", style: .default)
                    { _ in
                    self.socket.write(string: "{\"t\":\(7),\"d\": {\"topic\": \"wscochera\", \"event\": \"message\",\"data\": \(1) }}")
                    
                }
                actionSheetControllerIOS8.addAction(FourActionButton)
                    self.present(actionSheetControllerIOS8, animated: true, completion: nil)
            }
    @IBAction func btnClose(_ sender: Any) {
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "Cerrar", message: nil, preferredStyle: .actionSheet)
        let FourActionButton = UIAlertAction(title: "Cerrando", style: .default)
                    { _ in
                    self.socket.write(string: "{\"t\":\(7),\"d\": {\"topic\": \"wscochera\", \"event\": \"message\",\"data\": \(1) }}")
                    
                }
                actionSheetControllerIOS8.addAction(FourActionButton)
                    self.present(actionSheetControllerIOS8, animated: true, completion: nil)
            }
}
