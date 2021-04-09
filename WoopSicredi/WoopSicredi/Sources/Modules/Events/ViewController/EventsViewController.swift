//
//  EventsViewController.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 08/04/21.
//

import UIKit
import Lottie

class EventsViewController: UIViewController {
    
    var viewModel: EventsViewModelType?
    
    private lazy var tableView: UITableView = UITableView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self
        $0.delegate = self
        $0.rowHeight = UITableView.automaticDimension
        $0.register(EventsTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private lazy var animationView = AnimationView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.animation = Animation.named("lurking-cat")
        $0.backgroundColor = .white
        $0.loopMode = .loop
        $0.play()
    }
    
    var refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupView()
        
        viewModel?.fetchData(completion: completion)
    }
    
    private func completion() {
        DispatchQueue.main.async {
            self.navigationItem.title = "Eventos"
            self.animationView.removeFromSuperview()
            self.tableView.reloadData()
        }
    }
    
    private func setupView() {
        view.addSubview(tableView)
        view.addSubview(animationView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        animationView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}

extension EventsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfEvents ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EventsTableViewCell
        
        if let event = viewModel?.elementAt(index: indexPath.row) {
            cell?.fill(event: event)
        }
        
        return cell ?? UITableViewCell()
    }
}

extension EventsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel?.didTapElement(at: indexPath.row)
    }
}
