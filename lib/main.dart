import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('testBox');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//this is the reference of the box
   var mydb =Hive.box('testBox');
//write data
   void WriteData(){
    mydb.put('name', 'vinsha');
    print("data stored");   
   }
//read data
   void readData(){
   print(mydb.get('name'));

   }
//delete data
void deleteData(){
  mydb.delete('name');
  print("db deleted");
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15,),
            InkWell(
              onTap: () {WriteData();
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 176, 234, 178),),
                child:Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.pending_actions,color: Colors.white),SizedBox(width: 20),
                    Text("Write",style: TextStyle(color: Colors.white,fontSize: 15),),
                  ],
                ),),
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: () {
                readData();
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 112, 180, 114),
                ),
                child:Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.chrome_reader_mode_outlined,color: Colors.white),SizedBox(width: 20),
                    Text("Read",style: TextStyle(color: Colors.white,fontSize: 15),),
                  ],
                ),),
              ),
            ),
            
            SizedBox(height: 15,),
            InkWell(
              onTap: () {
                deleteData();
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 42, 107, 44),),
                child:Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete_outline,color: Colors.white),SizedBox(width: 20),
                    Text("Delete",style: TextStyle(color: Colors.white,fontSize: 15),),
                  ],
                ),),
              ),
            ),
            SizedBox(height: 15,),
           
          ]),
        ),
      ),     
    );
  }
}
