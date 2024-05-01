import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/data/work_out_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  void createNewWorkout()
  {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Create new workout "),
      content: TextField(),
      actions: [
        // save button
        MaterialButton(
          onPressed: (){},
          child: Text('save'),
        ),
        
        // cancel button
        MaterialButton(
          onPressed: (){},
          child: Text('cancel'),
        )
      ],
    ));
  }



  @override
  Widget build(BuildContext context) {
    return Consumer <WorkoutData> (
      builder: (context, value, child) => 
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
              title: const Text(
                'Workout Tracker',
                  style: TextStyle
                    (color: Colors.white),),
                ),
              floatingActionButton: FloatingActionButton(
                onPressed: createNewWorkout,
                          child: Icon(Icons.add),
                ),
        body: ListView.builder(
          itemCount: value.getWorkoutList().length ,
          itemBuilder: (context , index) => ListTile(
            title: Text(value.getWorkoutList()[index].name),
          ),
        ),
      ),
    );
  }
}