//
//  FocosController.swift
//  integ
//
//  Created by Carlos Rodriguez on 29/04/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import UIKit
import Alamofire
import Starscream

class FocosController: UIViewController,WebSocketDelegate {
    
    
    var socket: WebSocket!
    var isConnected = true
    let server = WebSocketServer()
    private var pingTimer:Timer?
    
    let Focos:[String] = []
    
    override func viewDidLoad() {
        var request = URLRequest(url: URL(string: "ws://54.146.120.131:3331/adonis-ws")!)
        request.timeoutInterval = 5
        socket = WebSocket(request: request)
        socket.delegate = self
        socket.connect()
    }
    func didReceive(event: WebSocketEvent, client: WebSocket) {
        switch event {
        case .connected(let headers):
            isConnected = true
            //socket.write(string: "{\"t\":\(1),\"d\":{\"topic\":\"wstemp\"}}")
            print("websocket is connected: \(headers)")
            self.pingTimer = Timer.scheduledTimer(timeInterval: 40, target: self, selector: #selector(ping), userInfo: nil, repeats: true)
            self.pingTimer?.fire()
        case .disconnected(let reason, let code):
            isConnected = false
            print("websocket is disconnected: \(reason) with code: \(code)")
        case .text(let string):
            print("datos ->", string)
            guard let jsonData = string.data(using: .utf8, allowLossyConversion: false) else {
                                print("Fail Convert To Data")
                                return
                            }
                            do {
                           print("entro 1")
                                if let jsonArray = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                                    if let dObject = jsonArray["d"] {
                                        print("entro 2")
                                        do {
                                            let dataObject = try JSONSerialization.data(withJSONObject: dObject, options: .fragmentsAllowed)
                                            do {
                                                print("entro 3")
                                                if let dataArray = try JSONSerialization.jsonObject(with: dataObject, options: []) as? [String:Any] {
                                                    if let topicws = dataArray["topic"]{
                                                        print(topicws)
                                                        if topicws as! String == "wsfoco"{
                                                            print("entro al topic")
                                                            if let datatemp = dataArray["data"]{
                                                               print(datatemp)
                                                                foco! = datatemp as! UICollectionView;  
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }else {
                                    print("Fail To Serialization")
                                }
                                } catch let error as NSError {
                                    print(error)
                                }
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
    @objc func ping() {
        self.getFoco()
    }
    func getFoco() {
            let packet = ["t":1,"d":["topic":"wsfoco"]] as [String : Any]
               do {
                   let data = try JSONSerialization.data(withJSONObject: packet, options: .fragmentsAllowed)
                   socket.write(data: data)
                   print("packetSend->",packet)
               }catch {
                   print("Error de serializacion")
               }
    }
    
    func outFoco() {
            let packet = ["t":2,"d":["topic":"wsfoco"]] as [String : Any]
               do {
                   let data = try JSONSerialization.data(withJSONObject: packet, options: .fragmentsAllowed)
                   socket.write(data: data)
                   print("packetSend->",packet)
               }catch {
                   print("Error de serializacion")
               }
        }
    
    func sendData(){
        self.getFoco()
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
    @IBOutlet weak var foco: UICollectionView!
}
