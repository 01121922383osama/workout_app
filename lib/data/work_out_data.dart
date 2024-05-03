import 'package:flutter/material.dart';
import 'package:workout_app/Model/Workout.dart';
import 'package:workout_app/Model/exercies.dart';

class WorkoutData extends ChangeNotifier {
/*
          WORKOUT DATA STRUCTURE

          -this overall list contains the different workouts
          -Each list contains a name  , and list  of exercises
 */

  List<Workout> workoutList = [
    Workout(name: "Upper body", exercise: [
      Exercise(name: "Bicep curls", weight: "20", reps: "20", sets: "3")
    ]),
    Workout(name: "Lower body", exercise: [
      Exercise(name: "squats", weight: "20", reps: "20", sets: "3")
    ])
  ];

  // get the list of workout's
  List<Workout> getWorkoutList() {
    return workoutList;
  }

  // get the lenght of a given workout
  int theNumberOfExerciseInWorkout(String workoutName) {
    Workout relaventWorkout = getRelaventWorkout(workoutName);
    return relaventWorkout.exercise.length;
  }

  // add a workout
  void addWorkout(String name) {
    //add a new workout with a blank list of exercises
    workoutList.add(Workout(name: name, exercise: []));
    notifyListeners();
  }

  // add an exercies to a workout
  void addExercies(String WorkoutName, String exerciseName, String weight,
      String reps, String sets) {
    //find the relevant workout
    Workout relaventWorkout = getRelaventWorkout(WorkoutName);

    relaventWorkout.exercise.add(
        Exercise(name: exerciseName, weight: weight, reps: reps, sets: sets));
    notifyListeners();
  }

  //check off an exercies
  void checkOffExercies(String workoutName, String exerciesName) {
    // find the relavent workout and the relavent exercises
    Exercise relaventExercies = getRelaventExercies(workoutName, exerciesName);

    // check off boolean to show the user completed the exercise
    // relaventExercies.isCompleted == !relaventExercies.isCompleted;  <===  `this was somthing u fixed your own habibi`
    relaventExercies.isCompleted = !relaventExercies.isCompleted;
    notifyListeners();
  }

  // return relavent workout object , given  a workout name
  Workout getRelaventWorkout(String workoutName) {
    Workout relaventWorkout =
        workoutList.firstWhere((Workout) => Workout.name == workoutName);

    return relaventWorkout;
  }

  // get the relavent exercies
  Exercise getRelaventExercies(String workoutName, String exerciesName) {
    Workout relaventWorkout = getRelaventWorkout(workoutName);

    // get  the relavent exercies in that workout
    Exercise relaventExercies = relaventWorkout.exercise
        .firstWhere((exercise) => exercise.name == exerciesName);

    return relaventExercies;
  }
}
