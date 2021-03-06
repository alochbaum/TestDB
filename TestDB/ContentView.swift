//
//  ContentView.swift
//  TestDB
//
//  Created by Andrew Lochbaum on 7/14/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true),],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        Button("Add") {
            _ = "Bob"
        }
        Button("Delete row")
        {
           // some later
        }
        List {
            ForEach(items) {
                item in
                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                Text(item.name ?? "Unknown")
            }
           // .onDelete(perform: deleteItems)
        }
        HStack {
            Image(systemName: "photo")
            VStack(alignment: .leading){
                Text("I need to learn more about the delete button")
                Text("Another line")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
        }
            .toolbar {
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
        
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.name="Bob"
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems() {
        withAnimation {
           // items[0].forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
