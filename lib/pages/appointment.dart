import 'package:flutter/material.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
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
            title: Text('Appointments'),
            backgroundColor: const Color.fromARGB(255, 12, 191, 223),
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            child: Text('Hello From Appointments'),
          ),
        ));
  }
}
