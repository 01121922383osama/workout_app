import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/data/work_out_data.dart';
import 'package:workout_app/pages/workout_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    final newWorkoutNameControler = TextEditingController();

  void createNewWorkout(){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Create new workout "),
        content: TextField(
          controller: newWorkoutNameControler,
        ),
          actions: [
            // save button
            MaterialButton(
              onPressed: save,
              child: Text('save'),
            ),
            
            // cancel button
        MaterialButton(
          onPressed: cansel,
            child: Text('cancel'),
        )
      ],
    ));
  }

      //go to workout page
      void goToWorkoutPage(String workoutName){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context)=> Workoutpage(
              workoutName: workoutName,
          ),
        ));
      }


    //save workout
    void save(){
      //get workout name for the text controller 
      String newEorkoutName = newWorkoutNameControler.text;
      // add workout to the workout list 
      Provider.of<WorkoutData>(context, listen: false).addWorkout(newEorkoutName);
      // to pop out after save 
      Navigator.pop(context);
      // to clear the text filed 
      clear();
    }

    //cansel 
    void cansel(){
      //to pop out after cansel 
      Navigator.pop(context);
      // to clear the text filed
      clear();
    }

      // clear controler 
      void clear(){
        newWorkoutNameControler.clear();
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
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () => goToWorkoutPage(value.getWorkoutList()[index].name),
            ),

          ),
        ),
      ),
    );
  }
}