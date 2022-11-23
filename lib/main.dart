import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const MyHomePage(title: 'BMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtControler = TextEditingController();
  var inControler = TextEditingController();
  var ftControler = TextEditingController();
  var result = '';

  var bgColor = Colors.green.shade200;

  @override
  Widget build(BuildContext context) {

    // Card(
    //   shadowColor: Colors.green,
    //   elevation: 7,
    //   child: Container(
    //       height: 50,
    //       width: 100,
    //       child: Center(child: Text('Hello',style: TextStyle(
    //           fontSize: 30,fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),
    //       )
    //       )
    //   ),
    // ),
   
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Card(
            shadowColor: Colors.black,
              child: Container(
                height: 400,
                width: 350,
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Clculate BMI',
                      style: TextStyle(
                          fontSize: 35, fontWeight: FontWeight.bold
                      ),
                    ),

                    const SizedBox(height: 11,),

                    TextField(
                      controller: wtControler,
                      decoration: const InputDecoration(
                        label: Text('Enter your weight in kg'),
                        prefixIcon: Icon(Icons.line_weight)
                      ),
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 11,),

                    TextField(
                      controller: ftControler,
                      decoration: const InputDecoration(
                          label: Text('Enter your height in feet'),
                          prefixIcon: Icon(Icons.height)
                      ),
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 11,),

                    TextField(
                      controller: inControler,
                      decoration: const InputDecoration(
                          label: Text('Enter your height in Inch'),
                          prefixIcon: Icon(Icons.height)
                      ),
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 11,),

                    ElevatedButton(onPressed: () {
                      var wt = wtControler.text.toString();
                      var ft = ftControler.text.toString();
                      var inch = inControler.text.toString();

                      if(wt != '' && ft != '' && inch != '') {

                        var cWt = double.parse(wt);
                        var cFt = double.parse(ft);
                        var cInch = double.parse(inch);

                        var totalInch = (cFt * 12) + cInch;
                        var totalCm = totalInch * 2.54;
                        var totalMetter = totalCm / 100;

                        var bmi = cWt / (totalMetter * totalMetter);

                        var msg = '';
                        if(bmi > 25){
                          msg = 'You\'re OverWeight!!!';
                          bgColor = Colors.red.shade500;
                        } else if(bmi < 18) {
                          msg = 'you\'re UnderWeight!!!';
                          bgColor = Colors.yellow.shade200;
                        } else {
                          msg = 'you\'re Healthy!!!';
                          bgColor = Colors.green.shade400;
                        }

                        setState(() {
                          result = '$msg \n Your BMI is : ${bmi.toStringAsFixed(2)}';
                        });
                      } else {
                        setState(() {
                          result = 'Please fill up the all required field';
                        });
                      }
                    }, child: const Text('Calcutate BMI')),

                    const SizedBox(height: 11,),
                    Text(
                      result, style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
            ),
          ),
    );
  }
}
