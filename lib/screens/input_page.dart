import 'package:bmi_calculator/screens/calculator_brain.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/constants.dart';

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

int weight = 50;
int age = 19;

class _InputPageState extends State<InputPage> {

  int height = 168;
  Gender selectedGender;

  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCards(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                    colour: selectedGender == Gender.male ? kActiveCardColour : kInactiveCardColour,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.mars,
                  label: 'MALE',

                ))
              ),
              Expanded(
                child:ReusableCards(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                    colour: selectedGender == Gender.female ? kActiveCardColour : kInactiveCardColour,
                cardChild: IconContent(
                icon: FontAwesomeIcons.venus,
                label: 'FEMALE'
              ))
              ),
            ],

          ),),
          Expanded(
            child: ReusableCards(
              colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,//error occurs. we need to give parameters to be aligned against something
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle
                      ),
                      Text(
                        'cm'
                      )
                    ],
                  ),
                  SliderTheme(//cant assign all of the slidertheme property, so applying .copywith
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB1555),
                      thumbColor: Color(0xFFEB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0)
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,

                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )],
                ),),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCards(colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT', style: kLabelTextStyle),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  weight -- ;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  weight ++ ;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),

                      ],
                    ),
                    /*cardChild: IconContent()*/)/*Container(
                  margin: EdgeInsets.all(15.0),
//color: Colors.blueAccent, if you use boxdecoration we use colr inside that boxDecoration, otherwise it results in error
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),*/
              ),
              Expanded(
                child: ReusableCards(colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('AGE', style: kLabelTextStyle),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            onPressed: (){
                              setState(() {
                                age -- ;
                              });
                            },
                            icon: FontAwesomeIcons.minus,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            onPressed: (){
                              setState(() {
                                age ++ ;
                              });
                            },
                            icon: FontAwesomeIcons.plus,
                          ),
                        ],
                      ),

                    ],
                  ),
                    /*cardChild: IconContent()*/)
              ),
            ],

          )),
          BottomButton(
            onTap: (){
              CalculatorBrain calc = new CalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ResultsPage(
                  bmiResult: calc.calculateBMI(), resultText: calc.getResult(), interpretation: calc.getInterpretation(),
                )
              ),
              );
              },
            buttonTitle: 'CALCULATE',
          ),

        ],
      ),
      /*body: Center(
        child: Text('Body Text'),
      ),*/
      /*floatingActionButton: Theme(
        data: ThemeData(accentColor: Colors.purple),
        child: FloatingActionButton(
          child: Icon(Icons.add),
        ),
      ),*/
    );
  }
}
