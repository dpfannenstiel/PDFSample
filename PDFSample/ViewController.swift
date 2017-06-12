//
//  ViewController.swift
//  PDFSample
//
//  Created by Dustin Pfannenstiel on 6/9/17.
//  Copyright © 2017 Dustin Pfannenstiel. All rights reserved.
//

import UIKit
import PDFKit

class ViewController: UIViewController {
    
    @IBOutlet var pdfView: PDFView!
    @IBOutlet var doubleTap: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = Bundle.main.url(forResource: "sample", withExtension: "pdf"),
            let document = PDFDocument(url:url) {
            pdfView.document = document
            pdfView.autoScales = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @IBAction func doubleTapped(_ sender: UITapGestureRecognizer) {
        
        let point = sender.location(in: pdfView)
        let aoi = pdfView.areaOfInterest(for: point)
        print(aoi)
        let page = pdfView.page(for: point, nearest: true)
        print(page)
        let selection = page?.selectionForLine(at: point)
        print(selection)
        let bounds = selection?.bounds(for: page!)
        print(bounds)
        let artBounds = page?.bounds(for: .artBox)
        print(artBounds)
        let zoom = artBounds!.width / bounds!.width
        pdfView.scaleFactor = zoom
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

