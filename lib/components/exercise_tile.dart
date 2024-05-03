import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {

      final String exerciseName;
      final String weight;
      final String reps;
      final String sets;
      final bool isCompleted;

      
  const ExerciseTile
  (
    {
      super.key,
      required this.exerciseName,
      required this.weight,
      required this.reps,
      required this.sets,
      required this.isCompleted,
    }
  );

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: ListTile(
            title: Text(
              '${exerciseName} :'
              ),
            subtitle: Row(
              children: [
                //weight
                Chip(label:
                  Text(' Wieght: $weight'
                  ,style:const TextStyle(color: Colors.white)
                  ),
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(width: 5,),
                // reps 
                Chip(label:
                  Text(' Reps: $reps'
                  ,style:const TextStyle(color: Colors.white)
                  ),
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(width: 5,),
              // sets 
              Chip(label:
                  Text('Sets: $sets' 
                  ,style:const TextStyle(color: Colors.white)
                  ),
                  backgroundColor: Colors.grey,
                ),
              ],
            ),
          ),
    );
  }
}