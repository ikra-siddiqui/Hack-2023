//Firstly add carosuel slider package in your pubspec.yaml file
// carousel_slider: ^4.0.0

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderEffect extends StatefulWidget {
const SliderEffect({super.key});


  @override
  State<SliderEffect> createState() => _SliderEffectState();
}

class _SliderEffectState extends State<SliderEffect> {
  int activeIndex = 3;
  List items = [
    "https://images.unsplash.com/photo-1461896836934-ffe607ba8211?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YXRobGV0ZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1517838277536-f5f99be501cd?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fGF0aGxldGV8ZW58MHx8MHx8fDA%3D",
    "https://images.unsplash.com/photo-1517838277536-f5f99be501cd?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fGF0aGxldGV8ZW58MHx8MHx8fDA%3D",
    "https://images.unsplash.com/photo-1461896836934-ffe607ba8211?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YXRobGV0ZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1552153623-3854a7212688?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDR8fGF0aGxldGV8ZW58MHx8MHx8fDA%3D"
  ];
  late ScrollController controller;
  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: SingleChildScrollView(
                    child: Column(children: [
                  Stack(children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 50),
                      child: Container(
                        height: 280,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 211, 93, 84)
                                    .withOpacity(0.5),
                                spreadRadius: 4,
                                blurRadius: 7,
                                offset: const Offset(0, 4),
                              ),
                            ]),
                        child: Card(
                          color: const Color.fromARGB(255, 5, 19, 31),
                          elevation: 2,
                          shadowColor: const Color.fromARGB(
                            255,
                            10,
                            73,
                            126,
                          ),
                          child: CarouselSlider(
                            items: items
                                .map((image) => Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 280,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                              image: NetworkImage(image),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                    ))
                                .toList(),
                            options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                setState(() {
                                  activeIndex = index;
                                });
                              },
                              height: 320,
                              viewportFraction: 1.0,
                              autoPlay: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ])
                ])))));
  }
}
