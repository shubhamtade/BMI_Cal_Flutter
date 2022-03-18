import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuseble_Card.dart';
import 'constants.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveContainerColor;
  Color femaleCardColor = kInactiveContainerColor;

  int height = 180;

  void updateCardColor(Gender selectGender) {
    if (selectGender == Gender.male) {
      if (maleCardColor == kInactiveContainerColor) {
        maleCardColor = kActiveContainerColor;
        femaleCardColor = kInactiveContainerColor;
      } else {
        maleCardColor = kInactiveContainerColor;
      }
    } else {
      if (femaleCardColor == kInactiveContainerColor) {
        femaleCardColor = kActiveContainerColor;
        maleCardColor = kInactiveContainerColor;
      } else {
        femaleCardColor = kInactiveContainerColor;
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
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

          // MIDDLE
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HIEGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  // SliderTheme(
                  //   data: SliderThemeData(
                  //     thumbShape: RoundRangeSliderThumbShape(
                  //       enabledThumbRadius: 15.0,
                  //     ),
                  //   ),
                  //   child: Slider(
                  //     value: height.toDouble(),
                  //     onChanged: (double newValue) {
                  //       setState(
                  //         () {
                  //           height = newValue.toInt();
                  //         },
                  //       );
                  //     },
                  //     thumbColor: Color(0xFFEB1555),
                  //     activeColor: Color(0xFFFFFFFF),
                  //     inactiveColor: Color(0xFF8D8E98),
                  //     min: 120,
                  //     max: 220,
                  //   ),
                  // ),

                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFFEB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),

          // Final Cards
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusebleCard(
                    colour: kActiveContainerColor,
                  ),
                ),
                Expanded(
                  child: ReusebleCard(
                    colour: kActiveContainerColor,
                  ),
                )
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: kBottomContainerHight,
          ),
        ],
      ),
    );
  }
}
