//
//  ViewController.swift
//  SuperHeros-IOS
//
//  Created by Mañanas on 21/5/25.
//

import UIKit

//
//  ViewController.swift
//  SuperheroLeague-iOS
//
//  Created by Mañanas on 20/5/25.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var superheroList: [Superhero] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        searchSuperheroesBy(name: "a")
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchSuperheroesBy(name: searchBar.text ?? "a")
    }
    
    func searchSuperheroesBy(name: String) {
        Task {
            superheroList = await SuperheroProvider.findSuperheroesByName(query: name)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            let detailVC = segue.destination as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let superhero = superheroList[indexPath.row]
            detailVC.superhero = superhero
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        superheroList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SuperheroViewCell", for: indexPath) as! SuperheroViewCell
        let superhero = superheroList[indexPath.row]
        cell.render(superhero: superhero)
        return cell
    }

}
