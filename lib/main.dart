import 'package:flutter/material.dart';

void main() {
  runApp(ToDoListApp());
}
class ToDoListApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: ToDoList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {

  final List<String> _todoThings = [];
  final TextEditingController _textcontroller = TextEditingController();

  void _addItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _todoThings.add(task);
      });
      _textcontroller.clear();
    }
  }
void _removeItem(int index){
    setState(() {
      _todoThings.removeAt(index);
    });
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.white70,
      appBar: AppBar(
        title:const  Text("To-Do List"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      body: Center(

            child:Container(
              padding:const EdgeInsets.all(16.0),
              width: 300,
              height: 500,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 2.5),
                    ),
                  ]
              ),

              child: Column(

                  children: [

                    Container(
                      child: Row(
                          children: [
                            Expanded(
                              child:TextField(
                                controller: _textcontroller,
                                decoration: const InputDecoration(
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter Your Task',
                                  fillColor: Colors.white70,
                                  labelStyle: TextStyle(
                                    color:Colors.black,
                                  ),
                                ),

                              ),
                            ),
                             const SizedBox(width: 25),
                            ElevatedButton(
                              onPressed: () => _addItem(_textcontroller.text),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white, backgroundColor: Colors.blue,
                                shape:const  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                )
                              ),
                              child: const Text('Add'),
                            ),
                          ]
                      ),
                    ),
                   Expanded(
                     child: ListView.builder(
                       itemCount:_todoThings.length ,
                       itemBuilder:(context,index) {
                         return ListTile(
                           title:Text(_todoThings[index]),
                           trailing:IconButton(
                             icon:const Icon(Icons.delete),
                             onPressed: () => _removeItem(index),
                           ),
                         );
                       }
                     ),
                   )
                  ]
              ),
            ),
            ),
      ),
      );
  }
}