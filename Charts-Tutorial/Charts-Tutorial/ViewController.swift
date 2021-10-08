//
//  ViewController.swift
//  Charts-Tutorial
//
//  Created by Dominic Danborn on 10/6/21.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var lineChartBox: LineChartView!
    @IBOutlet weak var pieChartBox: PieChartView!
    @IBOutlet weak var barChartBox: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let data = [5, 6, 2, 4 ,8, 3, 7, 8, 1 , 2, 8, 12, 1, 11, 10 ,11, 6]
        graphLineChart(dataArray: data)
    }
    
    func graphLineChart(dataArray: [Int]) {
        lineChartBox.frame = CGRect(x: 0, y: 0,
                                    width: self.view.frame.size.width,
                                    height: self.view.frame.size.width / 2)
        
        lineChartBox.center.x = self.view.center.x
        lineChartBox.center.y = self.view.center.y - 240
        
        lineChartBox.noDataText = "No data available"
        lineChartBox.noDataTextColor = UIColor.black
        
        var entries = [ChartDataEntry]()
        
        for i in 0..<dataArray.count {
            let value = ChartDataEntry(x: Double(i), y: Double(dataArray[i]) )
            entries.append(value)
        }
        
        let dataSet = LineChartDataSet(entries: entries, label: "Line Chart")
        dataSet.colors = ChartColorTemplates.liberty()
        
        let data = LineChartData(dataSet: dataSet)
        lineChartBox.data = data
        
        lineChartBox.chartDescription?.text = "Pi Values"
        
        lineChartBox.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
    }


}

