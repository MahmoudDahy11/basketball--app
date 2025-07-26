import 'package:count_app/cubit/counter_cubit.dart';
import 'package:count_app/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int teamAPoint = 0;
  int teamBPoint = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state) {
        if (state is CounterAIncrements) {
          teamAPoint = BlocProvider.of<CounterCubit>(context).teamAPoint;
        } else {
          teamBPoint = BlocProvider.of<CounterCubit>(context).teamBPoint;
        }
      },
      builder: (context, state) {
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
      },
    );
  }

  // ✅ Reset Button
  ElevatedButton ResetButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
      onPressed: () {
        // teamAPoint =
      },
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
            '$teamAPoint',
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
            '$teamBPoint',
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
        onPressed: () {
          if (isTeamA) {
            BlocProvider.of<CounterCubit>(
              context,
            ).teamIncrement(team: 'A', bottonNumber: 1);
          } else {
            BlocProvider.of<CounterCubit>(
              context,
            ).teamIncrement(team: 'B', bottonNumber: 1);
          }
        },
        child: const Text('Add 1 Point', style: TextStyle(color: Colors.black)),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
        onPressed: () {
          if (isTeamA) {
            BlocProvider.of<CounterCubit>(
              context,
            ).teamIncrement(team: 'A', bottonNumber: 2);
          } else {
            BlocProvider.of<CounterCubit>(
              context,
            ).teamIncrement(team: 'B', bottonNumber: 2);
          }
        },
        child: const Text('Add 2 Point', style: TextStyle(color: Colors.black)),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
        onPressed: () {
          setState(() {
            if (isTeamA) {
              BlocProvider.of<CounterCubit>(
                context,
              ).teamIncrement(team: 'A', bottonNumber: 3);
            } else {
              BlocProvider.of<CounterCubit>(
                context,
              ).teamIncrement(team: 'B', bottonNumber: 3);
            }
          });
        },
        child: const Text('Add 3 Point', style: TextStyle(color: Colors.black)),
      ),
    ];
  }
}
