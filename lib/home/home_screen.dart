import 'dart:math';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {

  HomeScreen({Key? key}) : super(key: key);

  final User? user = FirebaseAuth.instance.currentUser;
  var foto = [    
      {'gambar': 'keyboard.jpeg', 'title': 'keyboard', 'subtitle': 'services'}, 
           {'gambar': 'komputer.png', 'title': 'komputer', 'subtitle': 'services'},
           
  ];

  var navbar = [
    {'gambar': 'home.png', 'title': 'Home'},
    {'gambar': 'clipboard.png', 'title': 'Clipboard'},
    {'gambar': 'user.png', 'title': 'User'},
  ];

  int c_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget>[
                
                Text(DateFormat.yMEd().format(DateTime.now()), style: TextStyle(fontSize: 20, color: Colors.grey),),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Hello Anonymous!', style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w700),),
                    ImageIcon(AssetImage("image/bell.png"))
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.2), 
                        filled: true,
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    height: 60,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: ImageIcon(
                        AssetImage("image/filter.png"),
                        
                      ),
                    ),
                  
                  )
                ],
              ),
              const SizedBox(height: 30,),
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text('Prefential', style: TextStyle(fontSize: 17, ),),
                      const Text('10% Save on your next service', ),
                      Padding(
                        padding: const EdgeInsets.only(right: 200, top: 10),
                        child: MaterialButton(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: (){},
                          child: Row(
                            children: const [
                              Text('Recive', style: TextStyle(color: Colors.white),),
                              Icon(Icons.arrow_forward_ios, color: Colors.white, size: 15,)
                                      
                            ],
                          )
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  const Text('Home Appliances Repair', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                  Icon(Icons.arrow_forward_ios,
                   color: Colors.grey,
                   size: 20,),
                ],
              ),
              const SizedBox(height: 10,),
              Container(
                height: 280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: 
                (context, index){
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(
                            255, 
                            Random().nextInt(256),
                            Random().nextInt(256),
                            Random().nextInt(256),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      child: Image(
                            image: AssetImage(
                              "image/${foto[index]['gambar']}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Text(foto[index]['title']!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                        Text(foto[index]['subtitle']!, style: TextStyle(fontSize: 15, color: Colors.grey),),
                      ],
                    ),
                  );
                },
               
              )
            ),
              

                // Center(
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //      Text('Welcome ${user!.email}!'),
                //       SizedBox(height: 16.0),
                //       ElevatedButton(
                //         onPressed: () => FirebaseAuth.instance.signOut(),
                //         child: Text('Logout'),
                //       ),
                //     ],
                //   ),
                    
                // ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
      height: 60,
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: navbar.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            c_index = index;
                          });
                        },
                    child: ImageIcon(
                      AssetImage("image/${navbar[index]['gambar']}"),
                      color: c_index == index ? Colors.green : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

