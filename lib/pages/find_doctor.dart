import 'package:flutter/material.dart';

class FindDoctor extends StatefulWidget {
  const FindDoctor({super.key});

  @override
  State<FindDoctor> createState() => _FindDoctorState();
}

class _FindDoctorState extends State<FindDoctor> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            image: DecorationImage(
                image: AssetImage("assets/images/bgimg.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Find Doctor'),
            backgroundColor: const Color.fromARGB(255, 12, 191, 223),
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            padding: const EdgeInsets.all(10),
            child: Stack(children: [
              //align at bottom center using Align()
              Align(
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    onChanged: (val) {
                      print(val);
                    },
                    decoration: InputDecoration(
                      hintText: 'ডাক্তারের ধরন/নাম লিখুন',
                      suffixIcon: const Icon(Icons.send_outlined),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2, //<-- SEE HERE
                          color: Color.fromARGB(255, 8, 226, 255),
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2, //<-- SEE HERE
                          color: Color.fromARGB(255, 8, 226, 255),
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ))
            ]),
          ),
        ));
  }
}
