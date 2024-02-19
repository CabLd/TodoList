//
//  UserDatas.swift
//  TodoList
//
//  Created by yangtz on 2024/2/19.
//

import Foundation

class UserDatas {
    let userDefaults = UserDefaults.standard

    func LoadUserTodos() -> [Todo] {
        // 解码数据并返回数组
        if let data = UserDefaults.standard.data(forKey: "todos") {
            print("Load 解码成功")
            do {
                let decoder = JSONDecoder()
                let todosTmp = try decoder.decode([Todo].self, from: data)
                return todosTmp
            } catch {
                print("decoder failed")
            }
        }
        return []
    }

    func updateUserTodos(index: Int, todo: Todo) {
        if let data = UserDefaults.standard.data(forKey: "todos") {
            do {
                let decoder = JSONDecoder()
                var todosTmp = try decoder.decode([Todo].self, from: data)
                // update
                todosTmp[index] = todo
                do {
                    let encoder = JSONEncoder()
                    let data1 = try encoder.encode(todosTmp)
                    print("")
                    userDefaults.set(data1, forKey: "todos")
                } catch { print("Update failed")}
            } catch {print("decoder failed") }
        }
    }

    func addNewTodo(todo: Todo) {
        if let data = UserDefaults.standard.data(forKey: "todos") {
            do {
                let decoder = JSONDecoder()
                var todosTmp = try decoder.decode([Todo].self, from: data)
                // update
                todosTmp.append(todo)
                do {
                    let encoder = JSONEncoder()
                    let data1 = try encoder.encode(todosTmp)
                    userDefaults.set(data1, forKey: "todos")
                } catch { print("Update failed")}
            } catch {print("decoder failed") }
        } else {
            var todosTmp: [Todo] = []
            todosTmp.append(todo)
            do {
                let encoder = JSONEncoder()
                let data1 = try encoder.encode(todosTmp)
                userDefaults.set(data1, forKey: "todos")
            } catch { print("decoder failed in create todos first")}
        }
    }
}
