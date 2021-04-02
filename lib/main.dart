import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "BMI Calculator",
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "";

  void _resetFields() {
    ageController.text = "";
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculateBMI() {
    setState(() {
      int age = int.parse(ageController.text);
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;

      double bmi = weight / (height * height);

      if (bmi < 18.5) {
        _infoText = "Thin\nBMI: ${bmi.toStringAsPrecision(3)}";
      } else if (bmi >= 18.6 && bmi < 24.9) {
        _infoText = "Healthy\nBMI: ${bmi.toStringAsPrecision(3)}";
      } else if (bmi >= 25 && bmi < 29.9) {
        _infoText = "Overweight\nBMI: ${bmi.toStringAsPrecision(3)}";
      } else {
        _infoText = "Obese\nBMI: ${bmi.toStringAsPrecision(3)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF313131),
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          ),
        ],
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'What are you?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            debugPrint('male');
                          },
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Color(0xFFa0f0bb),
                            child: Image.asset(
                              "assets/male.png",
                              height: 30.0,
                              width: 30.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Male',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            debugPrint('female');
                          },
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Color(0xFFa0f0bb),
                            child: Image.asset(
                              "assets/female.png",
                              height: 30.0,
                              width: 30.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Female',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            debugPrint('non-binary');
                          },
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Color(0xFFa0f0bb),
                            child: Image.asset(
                              "assets/nonbinary.png",
                              height: 40.0,
                              width: 40.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Non-Binary',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: ageController,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'What\'s your age?',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),

                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 0.5,
                    ),
                  ),
                  // focusedBorder:
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Inform your age!";
                  }
                },
              ),
              SizedBox(height: 30.0),
              TextFormField(
                controller: heightController,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'What\'s your height in cm?',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Inform your height!";
                  }
                },
              ),
              SizedBox(height: 30.0),
              TextFormField(
                controller: weightController,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'What\'s your weight in kg?',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Inform your weight!";
                  }
                },
              ),
              SizedBox(height: 60.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 18.0),
                    primary: Color(0xFFa0f0bb),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30)),
                  ),
                  child: Text(
                    'Calculate your BMI',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _calculateBMI();
                    }
                  },
                ),
              ),
              SizedBox(height: 50.0),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
