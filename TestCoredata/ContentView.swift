import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    @Environment(\.managedObjectContext) var moc
    @State private var textYouJustTyped = ""
    
    var body: some View {
        VStack{
            List(students) { item in
                Text(item.name ?? "Unknown")
            }
            TextField("Put to coredata", text: $textYouJustTyped)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button{
                let student = Student(context: moc)
                student.id = UUID()
                student.name = textYouJustTyped
                try? moc.save()
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
