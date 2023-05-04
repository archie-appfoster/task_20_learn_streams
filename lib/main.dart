import 'dart:async';

import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamController<String> streamController = StreamController<String>();
   late Stream<String>? infostream;

  TextEditingController maha = TextEditingController();

  @override
  void initState() {
    infostream =streamController.stream.asBroadcastStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("learn streams"),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<String>(
                stream: infostream,
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    return Text(
                        snapshot.data ?? "Null data", style: TextStyle(
                      fontSize: 35
                  ),);

                  }else{
                    return Text("No Data"
                      ,style: TextStyle(
                          fontSize: 35
                      ),);

                  }

                }
              ),
              SizedBox(height: 20,),
              StreamBuilder<String>(
                  stream: infostream,
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      return Text(
                        snapshot.data ?? "Null data", style: TextStyle(
                          fontSize: 35
                      ),);

                    }else{
                      return Text("No Data"
                        ,style: TextStyle(
                            fontSize: 35
                        ),);

                    }

                  }
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: maha,
                  decoration: InputDecoration(
                    border: OutlineInputBorder()

                ),),
              ),
              ElevatedButton(onPressed: (){


                streamController.add(maha.text);
              }, child: Text("Done"))

            ]
        ),
      ),
    );;
  }
}

