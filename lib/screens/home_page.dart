import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // لحماية الشاشة من الكسر
          child: Column(
            children: [
              const SizedBox(height: 40),
              SizedBox(
                height: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: TeamAView()),
                    const VerticalDivider(
                      color: Colors.black,
                      thickness: 1,
                      indent: 20,
                      endIndent: 50,
                      width: 40,
                    ),
                    Expanded(child: TeamBView()),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              ResetButton(),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ Reset Button
  ElevatedButton ResetButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
      onPressed: () {},
      child: const Text(
        'Reset',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
    );
  }

  // ✅ Team A View
  Column TeamAView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Team A',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            '0',
            style: const TextStyle(fontSize: 200, fontWeight: FontWeight.w400),
          ),
        ),
        ...buildPointButtons(isTeamA: true),
      ],
    );
  }

  // ✅ Team B View
  Column TeamBView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Team B',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            '0',
            style: const TextStyle(fontSize: 200, fontWeight: FontWeight.w400),
          ),
        ),
        ...buildPointButtons(isTeamA: false),
      ],
    );
  }

  // ✅ Buttons Builder
  List<Widget> buildPointButtons({required bool isTeamA}) {
    return [
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
        onPressed: () {},
        child: const Text('Add 1 Point', style: TextStyle(color: Colors.black)),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
        onPressed: () {},
        child: const Text('Add 2 Point', style: TextStyle(color: Colors.black)),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
        onPressed: () {
          setState(() {
            if (isTeamA) {
            } else {}
          });
        },
        child: const Text('Add 3 Point', style: TextStyle(color: Colors.black)),
      ),
    ];
  }
}
