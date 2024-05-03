import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/data/work_out_data.dart';

class Workoutpage extends StatefulWidget {
  final String workoutName;
  const Workoutpage({super.key , required this.workoutName});

  @override
  State<Workoutpage> createState() => _WorkoutpageState();
}

class _WorkoutpageState extends State<Workoutpage> {
  @override
  Widget build(BuildContext context) {
    return  Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
      appBar: AppBar(title: Text(widget.workoutName)),
      body: ListView.builder(
        itemCount: value.theNumberOfExerciseInWorkout(widget.workoutName),
        itemBuilder: (context, index) => ListTile(
          title: Text(
            '${value
              .getRelaventWorkout(widget.workoutName)
              .exercise[index]
              .name} : '
          ),
          subtitle: Row(
            children: [
              //weight
              Chip(label:
                Text(' Wieght: ${value.getRelaventWorkout(widget.workoutName).exercise[index].weight}'
                ,style:const TextStyle(color: Colors.white)
                ),
                backgroundColor: Colors.grey,
              ),
              const SizedBox(width: 5,),
              // reps 
              Chip(label:
                Text(' Reps: ${value.getRelaventWorkout(widget.workoutName).exercise[index].reps}'
                ,style:const TextStyle(color: Colors.white)
                ),
                backgroundColor: Colors.grey,
              ),
              const SizedBox(width: 5,),
            // sets 
            Chip(label:
                Text(' Sets: ${value.getRelaventWorkout(widget.workoutName).exercise[index].sets}' 
                ,style:const TextStyle(color: Colors.white)
                ),
                backgroundColor: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}