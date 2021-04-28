//
//  FocosViewController.swift
//  integ
//
//  Created by Carlos Rodriguez on 26/04/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import UIKit
import Alamofire
import Starscream

class FocosViewController: UIViewController,WebSocketDelegate {
   
    
    
    var socket: WebSocket!
    var isConnected = true
    let server = WebSocketServer()
    
   
  
    override func viewDidLoad() {
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
            socket.write(string: "{\"t\":\(1),\"d\":{\"topic\":\"wsfoco\"}}")
            socket.write(string: "{\"t\":\(3),\"d\":{\"topic\":\"wsfoco\"}}")
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
    

}
