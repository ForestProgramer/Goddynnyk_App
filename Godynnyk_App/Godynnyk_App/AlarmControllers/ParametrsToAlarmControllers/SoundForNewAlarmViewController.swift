//
//  SoundForNewAlarmViewController.swift
//  Godynnyk_App
//
//  Created by Максим Оліярник on 24.02.2023.
//

import UIKit
// тут все так само як в классі RepeatAlarmChoice але тут вибрі може бути лише одного параметру
protocol GetSound {
    func addSound(sound : String)
}

class SoundForNewAlarmViewController: UIViewController {

    @IBOutlet weak var tableOfAlarmSounds: UITableView!
    
    let alarmSounds : [String] = ["Радар(типовий)", "Апекс","Брижі","Відкриття","Вістка","Дозвілля","Збори","Космос","Кристали","Куранти","Мерехтіння","На пляжі","Опівнічник","Осяяння","Пагорб","Піднесення","Престо","Пробудження","Промені","Радіомаяк"]
    
    
    var delegateSound : GetSound?
    override func viewDidLoad() {
        super.viewDidLoad()

        tableOfAlarmSounds.delegate = self
        tableOfAlarmSounds.dataSource = self
    }
    

}

extension SoundForNewAlarmViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        alarmSounds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SoundsNameCell", for: indexPath)
        
        cell.textLabel?.text = alarmSounds[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        let selectedSound = alarmSounds[indexPath.row]
        delegateSound?.addSound(sound: selectedSound)
        
    }
    // функція викликається коли комірка не вибрана і тут ми забираємо наш чекмарк
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
