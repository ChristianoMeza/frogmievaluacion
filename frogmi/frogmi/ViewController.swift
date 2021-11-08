//
//  ViewController.swift
//  frogmi
//
//  Created by Christian Meza on 08-11-21.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var storeTableView: UITableView!
    
    var stores               = ModelData()
    var page: String?        = "https://api.frogmi.com/api/v3/stores?per_page=10&page=1"
    var arrStores            = [ModelData.Stores]()
    let api_Authorization    = ""
    let api_uuid             = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeTableView.dataSource = self
        storeTableView.delegate   = self
        storeTableView.rowHeight  = 100.0
        self.getdata()
    }
    
    func getdata() {
        
      let url = URL(string: self.page!)!
      var request = URLRequest(url: url)
      request.addValue(self.api_uuid, forHTTPHeaderField: "X-Company-Uuid")
      request.addValue("Bearer \(self.api_Authorization)", forHTTPHeaderField: "Authorization")
      request.httpMethod = "GET"
      URLSession.shared.dataTask(with: request) {(data,response,error) in
          do {
              if let d = data {
                  let decodedLists = try JSONDecoder().decode(ModelData.self, from: d)
                  DispatchQueue.main.async {
                      self.stores   = decodedLists
                      self.page     = decodedLists.links?.next
                      self.arrStores.append(contentsOf: decodedLists.data)
                      self.storeTableView.reloadData()
                  }
              }else {
                  print("No Data")
              }
          } catch {
              print ("Error")
          }
          
      }.resume()
    }

}


extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            if indexPath.row + 1 == self.arrStores.count {
                self.getdata()
            }
        }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrStores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
        let cell = storeTableView.dequeueReusableCell(withIdentifier: "storeCell") as! StoreTVC
        
        cell.lbl_store.text        = self.arrStores[indexPath.row].attributes.name
        cell.lbl_code.text         = self.arrStores[indexPath.row].attributes.code
        cell.lbl_full_address.text = self.arrStores[indexPath.row].attributes.full_address
        
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        
        return cell
    }
    
}

