//
//  ListaTableViewController.swift
//  CajaMusical
//
//  Created by Mario E Salvatierra V on 7/31/16.
//  Copyright © 2016 Dunas. All rights reserved.
//

import UIKit

class ListaTableViewController: UITableViewController {
     let canciones = Canciones()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 1 {
        return canciones.lista.count
        }
        else { return 1 }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("identifier", forIndexPath: indexPath)
        
        // Configure the cell...
        if indexPath.section == 1 {
            cell.textLabel?.text = canciones.lista[indexPath.row].TituloCancion
            
            return cell
            
        } else {
            cell.textLabel?.text = "SHUFFLE"
            cell.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.1)
            return cell
        }
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toPlayer" {
            
            let pvc = segue.destinationViewController as! PlayerViewController
            
            if self.tableView.indexPathForSelectedRow?.section == 1 {
            let passThis = self.tableView.indexPathForSelectedRow?.row
                pvc.cancionSeleccionada = passThis!
            } else {
                let tamanoDeLista = uint(canciones.lista.count)
                let aleatorio = Int(arc4random_uniform(tamanoDeLista))
                pvc.cancionSeleccionada = aleatorio
            }
           // print(passThis)
        }
       
    }
    

}
