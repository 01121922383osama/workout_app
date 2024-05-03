import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/components/exercise_tile.dart';
import 'package:workout_app/data/work_out_data.dart';

class Workoutpage extends StatefulWidget {
  final String workoutName;
  const Workoutpage({super.key, required this.workoutName});

  @override
  State<Workoutpage> createState() => _WorkoutpageState();
}

class _WorkoutpageState extends State<Workoutpage> {
  // check box was tapped
  void onCheckBoxChanged(String workoutName, String exerciesName) {
    Provider.of<WorkoutData>(context, listen: false)
        .checkOffExercies(workoutName, exerciesName);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(title: Text(widget.workoutName)),
        body: ListView.builder(
            itemCount: value.theNumberOfExerciseInWorkout(widget.workoutName),
            itemBuilder: (context, index) => ExerciseTile(
                exerciseName: value
                    .getRelaventWorkout(widget.workoutName)
                    .exercise[index]
                    .name,
                weight: value
                    .getRelaventWorkout(widget.workoutName)
                    .exercise[index]
                    .weight,
                reps: value
                    .getRelaventWorkout(widget.workoutName)
                    .exercise[index]
                    .reps,
                sets: value
                    .getRelaventWorkout(widget.workoutName)
                    .exercise[index]
                    .sets,
                isCompleted: value
                    .getRelaventWorkout(widget.workoutName)
                    .exercise[index]
                    .isCompleted,
                onCheckBoxChanged: (val) {
                  onCheckBoxChanged(
                    widget.workoutName,
                    value
                        .getRelaventWorkout(widget.workoutName)
                        .exercise[index]
                        .name,
                  );
                  print(value);
                })),
      ),
    );
  }
}
