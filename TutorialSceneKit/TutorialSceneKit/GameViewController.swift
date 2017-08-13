//
//  GameViewController.swift
//  TutorialSceneKit
//
//  Created by Agstya  on 13/08/17.
//  Copyright © 2017 Bharat Nakum. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    
    var scnView: SCNView!
    var scnScene: SCNScene!
    var cameraNode: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupScene()
        setupCamera()
        spawnShape()
        addSphere()
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    // MARK:- Initial Setup 
    func setupView() {
        scnView = self.view as! SCNView
        scnView.autoenablesDefaultLighting = true
        scnView.isPlaying = true
    }
    
    func setupScene() {
        scnScene = SCNScene()
        scnView.scene = scnScene
        scnScene.background.contents = UIColor.blue
    }
    
    func setupCamera() {
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 5, z: 10)
        
        scnScene.rootNode.addChildNode(cameraNode)
    }
    
    func spawnShape() {
        var geometry: SCNGeometry
        
        geometry = SCNCapsule(capRadius: 0.3, height: 2.5)
            
        let color = UIColor.green
        geometry.materials.first?.diffuse.contents = color
        
        let geometryNode = SCNNode(geometry: geometry)
        
        geometryNode.physicsBody = SCNPhysicsBody(type: .static, shape: nil)
        geometryNode.physicsBody?.restitution = 2
        geometryNode.physicsBody?.friction = 0
        
        geometryNode.position = SCNVector3(x: 0.0, y: 0.0, z: 0.0)
        
        geometryNode.runAction(SCNAction.rotateBy(x: 0, y: 0, z: CGFloat(Double.pi / 2), duration: 0.0))
        
        scnScene.rootNode.addChildNode(geometryNode)
    }
    
    func addSphere() {
        var geometry: SCNGeometry
        
        geometry = SCNSphere(radius: 0.5)
        
        let color = UIColor.red
        geometry.materials.first?.diffuse.contents = color
        
        let geometryNode = SCNNode(geometry: geometry)
        
        geometryNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        geometryNode.physicsBody?.restitution = 0.55
        geometryNode.physicsBody?.friction = 0
       
        geometryNode.position = SCNVector3(x: 0.0, y: 5.0, z: 0.0)
        
        scnScene.rootNode.addChildNode(geometryNode)
    }

}
