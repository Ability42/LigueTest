//
//  File.swift
//  Ligue
//
//  Created by Stepan Paholyk on 11/16/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

import Foundation

struct Player: CustomStringConvertible {
    var name: String
    var index: Int // for tournament scheduler
    
    init(name: String, index: Int = -1) {
        self.name = name
        self.index = index
    }
    
    var description: String {
        return name
    }
}

struct Match: CustomStringConvertible {
    var home: Player
    var away: Player
    
    var description: String {
        return home.description + " - " + away.description
    }
    
    func swap() -> Match {
        return Match(home: away, away: home)
    }
}

typealias TournamentWeek = Array<Match>

func main() {
    guard isArgumentsCorrect() else { return }
    
    let numberOfPlayers = Int(CommandLine.arguments[1])!
    
    var twoTours = false
    
    if CommandLine.arguments.count == 3 {
        let secondArg = Bool(CommandLine.arguments[2])
        twoTours = secondArg ?? false
    }
    
    var players = [Player]()
    for i in 1 ... numberOfPlayers {
        players.append(Player(name: "Player\(i)"))
    }
    
    let schedule = createTournamentSchedule(players: players, twoTours: twoTours)
    for week in schedule {
        print(week)
    }
}

/// Returns `false` if error
func isArgumentsCorrect() -> Bool {
    if CommandLine.arguments.count > 1 {
        if Int(CommandLine.arguments[1]) == nil {
            print("ERROR: Invalid argument. Must be integer")
            return false
        }
    } else {
        print("ERROR: Missing argument.")
        return false
    }
    return true
}

func add(_ a: Int, _ b: Int, limit lim: Int) -> Int {
    let res = (a + b) % lim
    return res == 0 ? lim : res
}

func createTournamentSchedule(players pls: [Player], twoTours: Bool = false) -> [TournamentWeek] {
    let numberOfPlayers = pls.count
    
    var n = numberOfPlayers
    var limit = 0
    var factor = 0
    
    var players = [Player]()
    
    for (i, player) in pls.enumerated() {
        players.append(Player(name: player.name, index: i + 1))
    }
    
    if numberOfPlayers % 2 == 1 {
        n = n + 1
        let dummyPlayer = Player(name: "Dummy", index: n)
        players.append(dummyPlayer)
    }
    // set limit and factor
    limit = n - 1
    factor = n / 2
    
    let top = Array(players[0 ..< factor])
    let bottom = Array(players[factor ..< n].reversed())
    
    let firstWeek = generateFirstWeek(top, bottom)
    
    var weeks = [TournamentWeek]()
    var runningWeek = firstWeek
    weeks.append(firstWeek)
    
    for _ in 1 ..< limit {
        var tmpWeek = [Match]()
        
        for match in runningWeek {
            var home: Player!
            var away: Player!
            
            if match.home.index != n {
                
                home = players.first(where: { $0.index == add(factor, match.home.index, limit: limit) })
            } else {
                home = players.last!
            }
            
            if match.away.index != n {
                away = players.first(where: { $0.index == add(factor, match.away.index, limit: limit) })
            } else {
                away = players.last!
            }
            
            tmpWeek.append(Match(home: home, away: away))
        }
        
        tmpWeek[0] = tmpWeek[0].swap()
        
        runningWeek = tmpWeek
        weeks.append(runningWeek)
    }
    
    if numberOfPlayers % 2 == 1 {
        weeks = removeDummyMatches(weeks)
    }
    
    if twoTours {
        weeks = weeks + reversedWeeks(weeks)
    }
    
    return weeks
}

func removeDummyMatches(_ weeks: [TournamentWeek]) -> [TournamentWeek] {
    var weeksTmp = [TournamentWeek]()
    for week in weeks {
        weeksTmp.append(Array(week.dropFirst()))
    }
    return weeksTmp
}

func reversedWeeks(_ weeks: [TournamentWeek]) -> [TournamentWeek] {
    var weeksRes = [TournamentWeek]()
    
    for week in weeks {
        var weekTmp = [Match]()
        for game in week {
            weekTmp.append(game.swap())
        }
        weeksRes.append(weekTmp)
    }
    
    return weeksRes
}

func generateFirstWeek(_ top: [Player], _ bottom: [Player]) -> TournamentWeek {
    var week = [Match]()
    for (t, b) in zip(top, bottom) {
        week.append(Match(home: b, away: t))
    }
    return week
}
