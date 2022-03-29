import 'package:flutter/material.dart';
import 'home.dart';

// ignore: must_be_immutable
class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  bool selected = false;

  TextStyle textStyle1() => const TextStyle(
      color: Colors.amberAccent,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      letterSpacing: 1);

  TextStyle textStyle2() =>
      const TextStyle(color: Colors.tealAccent, fontSize: 25, letterSpacing: 1);

  Column body() {
    return Column(
      children: [
        const SizedBox(
          height: 300,
        ),
        Hero(
          tag: 'hero',
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              },
              child: const Icon(
                Icons.yard,
                color: Colors.tealAccent,
                size: 200,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              selected = !selected;
            });
          },
          child: Center(
            child: AnimatedDefaultTextStyle(
                child: const Text('Convrtx'),
                style: selected ? textStyle1() : textStyle2(),
                duration: const Duration(seconds: 1)),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blueGrey, body: body());
  }
}
