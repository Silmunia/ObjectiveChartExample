//
//  ViewController.swift
//  ObjectiveChartExample
//
//  Created by Pedro Henrique on 28/07/21.
//

import UIKit
import ObjectiveChart

class ViewController: UIViewController {
    
    let pieChart = PieChartController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        // Creates points for the line
        let pointA = LineChartData(name: "A", value: 2)
        let pointB = LineChartData(name: "B", value: 10)
        let pointC = LineChartData(name: "C", value: 7)
        
        // Creates a line using the created points
        let lineA = LineChartComponent(title: "Line A", color: .yellow, thickness: 1, data: [pointA, pointB, pointC])
        
        // Repeats the process for a second line
        let pointD = LineChartData(name: "A", value: -5)
        let pointE = LineChartData(name: "B", value: 23)
        let lineB = LineChartComponent(title: "Line B", color: .blue, thickness: 1, data: [pointD, pointE])
                
        // Initializes the chart with a frame and lines created
        let lineChart = LineChartController(frame: CGRect(x: 30, y: 75, width: 350, height: 350), data: [lineA, lineB], axisColor: .green, backgroundColor: .clear)
        
        // Adds line chart to view
        self.view.addSubview(lineChart)
        
        // Creates the data objects for each segment in the pie chart
        let model: PieChartData = .init(title: "A", value: 50.0)
        let model2: PieChartData = .init(title: "B", value: 150.0)
        let model3: PieChartData = .init(title: "C", value: 1250.0)
        let model4: PieChartData = .init(title: "D", value: 750.0)

        // Creates the pie chart's segments using the data objects
        let component = PieChartComponent(model: model, color: .white)
        let component2 = PieChartComponent(model: model2, color: .red)
        let component3 = PieChartComponent(model: model3, color: .orange)
        let component4 = PieChartComponent(model: model4, color: .blue)

        // Sets database, chart background color and center circle
        pieChart.database = [component, component2, component3, component4]
        pieChart.backgroundColor = .clear
        pieChart.centerCircleRadius = 90.0
        
        // Adds pie chart to view
        self.view.addSubview(pieChart)

        // Sets constraints and positioning
        pieChart.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            pieChart.widthAnchor.constraint(equalToConstant: 200),
            pieChart.heightAnchor.constraint(equalToConstant: 200),
            pieChart.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
            pieChart.centerXAnchor.constraint(equalTo: view.centerXAnchor)

        ])
    }
}

