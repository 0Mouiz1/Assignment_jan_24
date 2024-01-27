// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Grade Calculator',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: GradeCalculator(),
//     );
//   }
// }
//
// class GradeCalculator extends StatefulWidget {
//   @override
//   _GradeCalculatorState createState() => _GradeCalculatorState();
// }
//
// class _GradeCalculatorState extends State<GradeCalculator> {
//   TextEditingController subject1Controller = TextEditingController();
//   TextEditingController subject2Controller = TextEditingController();
//   TextEditingController subject3Controller = TextEditingController();
//   TextEditingController subject4Controller = TextEditingController();
//   TextEditingController subject5Controller = TextEditingController();
//
//   double totalMarks = 500;
//
//   String grade = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           shadowColor:const Color(0xff,
//           ),
//           elevation:60,
//            shape: const RoundedRectangleBorder(
//              borderRadius: BorderRadius.vertical(
//                bottom: Radius.circular(20),
//              ),
//            ),
//           //elevation:6.0,
//           backgroundColor:Color(0xfffa1f1f),
//         centerTitle:true,
//           title: const Text(
//         'Grade Calculator',
//
//       )),
//       body: ListView(
//         scrollDirection: Axis.vertical,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextField(
//                   //color:Colors.red,
//                   controller: subject1Controller,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(labelText: 'Subject 1 Marks'),
//                 ),
//                 TextField(
//                   controller: subject2Controller,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(labelText: 'Subject 2 Marks'),
//                 ),
//                 TextField(
//                   controller: subject3Controller,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(labelText: 'Subject 3 Marks'),
//                 ),
//                 TextField(
//                   controller: subject4Controller,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(labelText: 'Subject 4 Marks'),
//                 ),
//                 TextField(
//                   controller: subject5Controller,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(labelText: 'Subject 5 Marks'),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     calculateGrade();
//                   },
//                   child: Text('Calculate Grade'),
//                 ),
//                 SizedBox(height: 20),
//                 Text('Grade: $grade', style: TextStyle(fontSize: 20)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void calculateGrade() {
//     double marks1 = double.tryParse(subject1Controller.text) ?? 0;
//     double marks2 = double.tryParse(subject2Controller.text) ?? 0;
//     double marks3 = double.tryParse(subject3Controller.text) ?? 0;
//     double marks4 = double.tryParse(subject4Controller.text) ?? 0;
//     double marks5 = double.tryParse(subject5Controller.text) ?? 0;
//
//     double obtainedMarks = marks1 + marks2 + marks3 + marks4 + marks5;
//     double percentage = (obtainedMarks / totalMarks) * 100;
//
//     if (percentage > 80) {
//       grade = 'A grade';
//     } else if (percentage >= 70 && percentage <= 79) {
//       grade = 'B grade';
//     } else if (percentage >= 60 && percentage <= 69) {
//       grade = 'C grade';
//     } else if (percentage >= 40 && percentage <= 59) {
//       grade = 'D grade';
//     } else {
//       grade = 'Fail';
//     }
//
//     setState(() {});
//   }
// }
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner : false,
      title: 'Grade Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GradeCalculator(),
    );
  }
}

class GradeCalculator extends StatefulWidget {
  const GradeCalculator({super.key});

  @override
  _GradeCalculatorState createState() => _GradeCalculatorState();
}

class _GradeCalculatorState extends State<GradeCalculator> {
  TextEditingController subject1Controller = TextEditingController();
  TextEditingController subject2Controller = TextEditingController();
  TextEditingController subject3Controller = TextEditingController();
  TextEditingController subject4Controller = TextEditingController();
  TextEditingController subject5Controller = TextEditingController();

  String result = '';
  String grade = '';

  void calculateGrade() {
    int totalMarks = 500;

    int obtainedMarks = int.parse(subject1Controller.text) +
        int.parse(subject2Controller.text) +
        int.parse(subject3Controller.text) +
        int.parse(subject4Controller.text) +
        int.parse(subject5Controller.text);

    double percentage = (obtainedMarks / totalMarks) * 100;

    setState(() {
      if (percentage > 80) {
        grade = 'A';
      } else if (percentage >= 70 && percentage <= 79) {
        grade = 'B';
      } else if (percentage >= 60 && percentage <= 69) {
        grade = 'C';
      } else if (percentage >= 40 && percentage <= 59) {
        grade = 'D';
      } else {
        grade = 'Fail';
      }

      result = 'Grade: $grade \nPercentage: ${percentage.toStringAsFixed(2)}%';
    });
  }

  void clearProgress() {
    subject1Controller.clear();
    subject2Controller.clear();
    subject3Controller.clear();
    subject4Controller.clear();
    subject5Controller.clear();
    result = '\n';
    grade = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   centerTitle: true,
      //   title: const Text(
      //     'Grade Calculator',
      //     style: TextStyle(
      //       color: Color(0xff816451),
      //       fontWeight: FontWeight.bold,
      //       fontSize: 30,
      //     ),
      //   ),
      // ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://images.pexels.com/photos/14458702/pexels-photo-14458702.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
            // Replace with your image asset path
            fit: BoxFit.cover,
          ), // color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
                child: Text(
                  'Religious Studies',
                  style: TextStyle(
                    color: Color(0xff6f4d37),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              TextField(
                controller: subject1Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  //labelText: 'Subject 1 Marks',
                  //  hintStyle: TextStyle(color: Colors.green),
                  // Set hint text color
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xff6f4d37)), // Set border color
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: Text(
                  'English',
                  style: TextStyle(
                    color: Color(0xff6f4d37),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              TextField(
                controller: subject2Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  // labelText: 'Subject 2 Marks',
                  // hintStyle: TextStyle(color: Colors.green),
                  // Set hint text color
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xff6f4d37)), // Set border color
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: Text(
                  'Sciences',
                  style: TextStyle(
                    color: Color(0xff6f4d37),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              TextField(
                controller: subject3Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  //: 'Subject 3 Marks',
                  //  hintStyle: TextStyle(color: Colors.green),
                  // Set hint text color
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xff6f4d37)), // Set border color
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: Text(
                  'Language Studies',
                  style: TextStyle(
                    color: Color(0xff6f4d37),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              TextField(
                controller: subject4Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  //labelText: 'Subject 4 Marks',
                  //hintStyle: TextStyle(color: Colors.green), // Set hint text color
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xff6f4d37)), // Set border color
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: Text(
                  'Mathematics',
                  style: TextStyle(
                    color: Color(0xff6f4d37),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              TextField(
                controller: subject5Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  //labelText: 'Subject 5 Marks',
                  // hintStyle: TextStyle(color: Colors.transparent),
                  // filled: true,
                  //fillColor: Colors.white,
                  // Set hint text color
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xff6f4d37)), // Set border color
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                      0xff816451), // Set the background color of the button
                ),
                onPressed: calculateGrade,
                child: const Text(
                  'Calculate Grade',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(result, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          mini : true,
        backgroundColor: Color(0xff816451),

        onPressed: clearProgress,
        tooltip: 'Clear Progress',
        child: const Icon(
          Icons.clear,
          color: Colors.white,
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.leftFloat,
    );
  }
}
