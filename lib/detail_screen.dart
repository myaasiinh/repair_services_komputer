import 'package:flutter/material.dart';


class DetailScreen extends StatefulWidget {

    const DetailScreen({Key? key}) : super(key: key);

    @override
    State<DetailScreen> createState() => _DetailScreenState();

}


class _DetailScreenState extends State<DetailScreen> {

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            appBar: AppBar(
                title: const Text('Detail Screen'),
                backgroundColor: Colors.blue,
                elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(children: [
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('image/komputer.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ]),
              ),
            )
        );
    }
}
