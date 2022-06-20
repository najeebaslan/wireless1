import 'package:flutter/material.dart';
import '../../../exports/export_manager.dart';

builshowDialogErea(
  BuildContext context,
  CoverageArea data2,
) {
  TextEditingController upadatedata = TextEditingController();
  showDialog<void>(
      context: context,
      builder: (
        BuildContext context,
      ) {
        var _formKey = GlobalKey<FormState>();

        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            content: ts(
              "تعديل : ${data2.name}",
              const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                fontFamily: StyleWidget.fontName,
                letterSpacing: 0.0,
                color: Colors.black,
              ),
            ),
            actions: <Widget>[
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
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                        await AllEreaApi().updateAllcaverage(
                            upadatedata.text, data2.id, context);

                        Navigator.of(context).pop();
                        print('success');
                        upadatedata.clear();
                      }
                    },
                  ),
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
                ],
              ),
            ],
          ),
        );
      });
}

builshowDialogPackage(
  BuildContext context,
  PackagePriceId data2,
) {
  TextEditingController upadatedata = TextEditingController();
  showDialog<void>(
      context: context,
      builder: (
        BuildContext context,
      ) {
        var _formKey = GlobalKey<FormState>();

        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            content: ts(
              "تعديل : ${data2.packagePrice}",
              const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                fontFamily: StyleWidget.fontName,
                letterSpacing: 0.0,
                color: Colors.black,
              ),
            ),
            actions: <Widget>[
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
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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

                        var gg = await packageApi.updatePackage(
                          data2.id,
                          upadatedata.text,
                        );
                        print(gg);

                        Navigator.of(context).pop();
                        print('success');
                        upadatedata.clear();
                      }
                    },
                  ),
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
                ],
              ),
            ],
          ),
        );
      });
}

buildTextFormFieldEdet(
  TextEditingController controller,
  TextInputType number,
) {
  return TextFormField(
    keyboardType: number,
    cursorColor: Colors.blue,
    controller: controller,
    maxLines: null,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.all(5.0),
        focusColor: Colors.orange,
        hoverColor: Colors.red,
        errorStyle: const TextStyle(
          color: Color.fromARGB(255, 255, 164, 27),
          height: 1,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        filled: true,
        fillColor: Colors.white70),
    expands: false,
    onSaved: (value) => value!,
    validator: (name) {
      if (name!.isEmpty) {
        return ('يجب ادخال نص التعديل');
      }
      return null;
    },
  );
}
