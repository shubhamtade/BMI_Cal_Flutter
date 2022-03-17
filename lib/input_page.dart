import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuseble_Card.dart';

const bottomContainerHight = 80.0;
const activeContainerColor = Color(0xFF1D1E33);
const inactiveContainerColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveContainerColor;
  Color femaleCardColor = inactiveContainerColor;

  void updateCardColor(Gender selectGender) {
    if (selectGender == Gender.male) {
      if (maleCardColor == inactiveContainerColor) {
        maleCardColor = activeContainerColor;
        femaleCardColor = inactiveContainerColor;
      } else {
        maleCardColor = inactiveContainerColor;
      }
    } else {
      if (femaleCardColor == inactiveContainerColor) {
        femaleCardColor = activeContainerColor;
        maleCardColor = inactiveContainerColor;
      } else {
        femaleCardColor = inactiveContainerColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateCardColor(Gender.male);
                      });
                    },
                    child: Container(
                      // child: cardChild,
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: maleCardColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 80,
                            color: Color(0xFF8D8E98),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'MALE',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF8D8E98),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          updateCardColor(Gender.female);
                        },
                      );
                    },
                    child: Container(
                      // child: cardChild,
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: femaleCardColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.venus,
                            size: 80,
                            color: Color(0xFF8D8E98),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'FEMALE',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF8D8E98),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusebleCard(
              colour: activeContainerColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusebleCard(
                    colour: activeContainerColor,
                  ),
                ),
                Expanded(
                  child: ReusebleCard(
                    colour: activeContainerColor,
                  ),
                )
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHight,
          ),
        ],
      ),
    );
  }
}
