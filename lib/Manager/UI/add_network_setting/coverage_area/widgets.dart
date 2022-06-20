
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

import '../../../../exports/export_manager.dart';

class WidgetCoverage {
  //---------------This is For Edite Covarage Area ----------------//
  static Widget widgetEdit(
    List<CoverageArea>? _area,
    int index,
    BuildContext context,
  ) {
    var _formKey = GlobalKey<FormState>();
    TextEditingController upadatedata = TextEditingController();
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(children: <Widget>[
            SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      child: buildTextFormFieldEdet(
                        upadatedata,
                        TextInputType.emailAddress,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            10.height,
          ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FlatButton(
              color: Colors.blue[50],
              child: ts(
                "الغاء",
                const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: StyleWidget.fontName,
                  letterSpacing: 0.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              color: Colors.green,
              child: ts(
                "تعديل",
                const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: StyleWidget.fontName,
                  letterSpacing: 0.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  await AllEreaApi().updateAllcaverage(upadatedata.text, _area?[index].id, context);

                  upadatedata.clear();
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  //---------------This is For Edite Covarage Delete ----------------//
  static Widget widgetDelete(
    List<CoverageArea>? _area,
    int index,
    BuildContext context,
  ) {
    return Container(
      color: kPrimaryColor,
      child: Column(
        children: [
          Text(
            ' هل تريد حذف ${_area?[index].name}',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              fontFamily: StyleWidget.fontName,
              letterSpacing: 0.0,
              color: FuAppTheme.customTheme.withe,
            ),
          ),
          15.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton(
                color: Colors.blue[50],
                child: ts(
                  "الغاء",
                  const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: StyleWidget.fontName,
                    letterSpacing: 0.0,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                color: Color(0xFFEE895A),
                child: ts(
                  "موافق",
                  TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: StyleWidget.fontName,
                    letterSpacing: 0.0,
                    color: FuAppTheme.customTheme.withe,
                  ),
                ),
                onPressed: () async {
                  bool result = await allEreaApi.deleteAreaById(
                      id: _area![index].id.toString(), context: context);
                  if (result == true) {
                    _area.removeWhere((item) => item.name == _area[index].name);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//--------This is for inamation dailog
class Sprung extends Curve {
  factory Sprung([double damping = 20]) => Sprung.custom(damping: damping);

  Sprung.custom({
    double damping = 20,
    double stiffness = 180,
    double mass = 1.0,
    double velocity = 0.0,
  }) : this._sim = SpringSimulation(
          SpringDescription(
            damping: damping,
            mass: mass,
            stiffness: stiffness,
          ),
          0.0,
          1.0,
          velocity,
        );

  final SpringSimulation _sim;

  @override
  double transform(double t) => _sim.x(t) + t * (1 - _sim.x(1.0));
}
