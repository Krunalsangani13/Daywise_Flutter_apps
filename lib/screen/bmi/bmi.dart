import 'package:flutter/material.dart';

class bmi extends StatefulWidget {
  const bmi({super.key});

  @override
  _bmiState createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  final TextEditingController agecontroller = new TextEditingController();
  final TextEditingController heightcontroller = new TextEditingController();
  final TextEditingController weightcontroller = new TextEditingController();
  double? result;
  String? weightstatus;

  void calculate(){
      int age=int.parse(agecontroller.text);
      double height=double.parse(heightcontroller.text)/100;
      double weight=double.parse(weightcontroller.text);

      setState(() {
            result=weight/(height*height);
      });

      if(result! < 18.5){
        weightstatus="Underweight";
      }else if(result! >=18.5 && result! <24.9 ){
          weightstatus="Normal Weight";
      }else if(result! >=24.9 && result! <29.9){
        weightstatus="Overweight";
      }else{
        weightstatus="Obese";
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI APP')),
      body: Padding(
        padding:const EdgeInsets.all(16),
        child: Form(
            child: Column(
          children: <Widget>[
            Text('BMI Calculater'),
            SizedBox(height: 12),


            TextFormField(
              controller: agecontroller,
              decoration: InputDecoration(labelText: 'Enter your age'),
              keyboardType: TextInputType.number,
              validator: (value) {
                  if (value!.isEmpty) {
                     return 'pls enter data';
                  } else if (double.tryParse(value!) == null || double.parse(value) <= 0) {
                       return 'Please enter a valid number';
                  }}),
            SizedBox(height: 12),

            TextFormField(
              controller: heightcontroller,
              decoration: InputDecoration(labelText: 'Enter your height'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'pls enter data';
                } else if (double.tryParse(value!) == null || double.parse(value) <= 0) {
                  return 'Please enter a valid number';
                }
              },
            ),
            SizedBox(height: 12),

            TextFormField(
              controller: weightcontroller,
              decoration: InputDecoration(labelText: 'Enter your weight'),
              keyboardType: TextInputType.number,
              validator:  (value) {
                if (value!.isEmpty) {
                return 'pls enter data';
                } else if (double.tryParse(value!) == null || double.parse(value) <= 0) {
                return 'Please enter a valid number';
                }}),
            SizedBox(height: 12),

            ElevatedButton(onPressed: calculate, child: Text('Calculate BMI')),
            SizedBox(height: 12),

            if(result!=null)
              Text('your BMI is: ${result?.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),

            Text(' your are ${weightstatus}',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
          ],
        )),
      ),
    );
  }
}
