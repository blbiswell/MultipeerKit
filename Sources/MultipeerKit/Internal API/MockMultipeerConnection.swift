import Foundation
import MultipeerConnectivity.MCPeerID

final class MockMultipeerConnection: MultipeerProtocol {

    let localPeer: Peer = {
        let underlyingPeer = MCPeerID(displayName: "MockPeer")
        return try! Peer(peer: underlyingPeer, discoveryInfo: nil)
    }()

    var didReceiveData: ((Data, Peer) -> Void)?
    var didStartReceivingResource: ((String, Peer, Progress) -> Void)?
    var didFinishReceivingResource: ((String, Peer, URL?, Error?) -> Void)?
    var didFindPeer: ((Peer) -> Void)?
    var didLosePeer: ((Peer) -> Void)?
    var didConnectToPeer: ((Peer) -> Void)?
    var didDisconnectFromPeer: ((Peer) -> Void)?
    
    var isRunning = false

    func resume() {
        isRunning = true
    }

    func stop() {
        isRunning = false
    }

    func broadcast(_ data: Data) throws {
        didReceiveData?(data, localPeer)
    }

    func send(_ data: Data, to peers: [Peer]) throws {
        
    }

    func sendResource(at resourceURL: URL, withName resourceName: String, to peer: Peer, withCompletionHandler completionHandler: ((Error?) -> Void)?) -> Progress? {
        return nil
    }
    
    func invite(_ peer: Peer, with context: Data?, timeout: TimeInterval, completion: InvitationCompletionHandler?) {
        
    }
    
    func getLocalPeer() -> Peer? {
        return localPeer
    }

}
