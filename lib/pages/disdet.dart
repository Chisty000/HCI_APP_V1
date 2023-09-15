import 'dart:ffi';
import './find_doctor.dart';
import 'package:flutter/material.dart';

class DiseaseDetection extends StatefulWidget {
  const DiseaseDetection({super.key});

  @override
  State<DiseaseDetection> createState() => _DiseaseDetectionState();
}

class _DiseaseDetectionState extends State<DiseaseDetection> {
  final List<String> entries = <String>[];
  final TextEditingController _controller = TextEditingController();
  var isResponse = false;
  var response =
      'আপনার গ্যাস্ট্রিক হবার সম্ভাবনা সর্বোচ্চ এছাড়াও সামান্য হৃদরোগের ঝুকি রয়েছে';
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
            backgroundColor: const Color.fromARGB(255, 12, 191, 223),
            title: const Text('Disease Detection'),
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      int itemCount = entries.length ?? 0;
                      int Index = itemCount - 1 - index;
                      return Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(155, 12, 191, 223)),
                        child: Center(child: Text('${entries[Index]}')),
                      );
                    }),
              ),
              if (isResponse) ...[
                Container(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FindDoctor()))
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 18, 109, 0)),
                          child: Text(
                              'আপনার সমস্যার জন্য ২ বিশেষজ্ঞ দেখতে এখানে চাপুন',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          isResponse = !isResponse;
                          setState(() {});
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 223, 12, 12)),
                          child: Text(
                            'আরো সমস্যা লিখতে এখানে চাপুন',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              if (!isResponse) ...[
                Container(
                  height: 100,
                  padding: const EdgeInsets.all(10),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: TextField(
                        onSubmitted: (val) {
                          entries.add(val);
                          _controller.clear();
                          if (val.contains('buke betha')) {
                            entries.add(response);
                            isResponse = true;
                          }
                          setState(() {});
                        },
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'আপনার রোগের লক্ষনগুলো এখানে লিখুন',
                          suffixIcon: GestureDetector(
                              onTap: () {
                                var val = _controller.text;
                                entries.add(val);
                                _controller.clear();
                                if (val.contains('buke betha')) {
                                  entries.add(response);
                                  isResponse = true;
                                }
                                setState(() {});
                              },
                              child: const Icon(Icons.send_outlined)),
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
                      )),
                )
              ],
            ],
          ),
        ));
  }
}
