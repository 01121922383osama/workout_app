import 'package:flutter/material.dart';

class Workoutpage extends StatefulWidget {
  final String workoutName;
  const Workoutpage({super.key , required this.workoutName});

  @override
  State<Workoutpage> createState() => _WorkoutpageState();
}

class _WorkoutpageState extends State<Workoutpage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text(widget.workoutName) ,),
    );
  }
}