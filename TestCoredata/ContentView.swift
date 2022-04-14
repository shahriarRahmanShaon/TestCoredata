import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student> // we fetch the data from database using this doorway
    @Environment(\.managedObjectContext) var moc // managed object context is the platform to which we used to communcicate with the database
    
    @State private var textYouJustTyped = ""
    
    var body: some View {
        VStack{
            List(students) { item in
                Text(item.name ?? "Unknown")
            }
            TextField("Put to coredata", text: $textYouJustTyped)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button{
                
                let student = Student(context: moc) // initialize the database with the managedobjectcontext platform
                
                student.id = UUID()
                student.name = textYouJustTyped
                
                try? moc.save() // save into the database
                
                textYouJustTyped = ""
            }label: {
                Text("push to coredata")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
