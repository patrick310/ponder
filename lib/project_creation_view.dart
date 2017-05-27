import 'dart:async';

import 'package:flutter/material.dart';


class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({Key key}) : super(key: key);

  static const String routeName = 'project/create-form';

  @override
  CreateProjectPageState createState() => new CreateProjectPageState();
}

class ProjectData {
  String subject = '';
  String location = '';
}

class CreateProjectPageState extends State<CreateProjectPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  ProjectData project = new ProjectData();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  bool _autovalidate = false;
  bool _formWasEdited = false;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
      showInSnackBar('Please enter a valid model type');
    } else {
      form.save();
      showInSnackBar(
          'New project created for ${project.subject} at ${project.location}');
    }
  }

  Future<bool> _warnUserAboutInvalidData() async {
    final FormState form = _formKey.currentState;
    if (form == null || !_formWasEdited || form.validate()) return true;
    return await showDialog<bool>(
          context: context,
          child: new AlertDialog(
            title: const Text('This form has errors'),
            content: const Text('Really leave this form?'),
            actions: <Widget>[
              new FlatButton(
                child: const Text('YES'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              new FlatButton(
                child: const Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: const Text('Start a Project'),
      ),
      body: new Form(
          key: _formKey,
          autovalidate: _autovalidate,
          onWillPop: _warnUserAboutInvalidData,
          child: new ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.subject),
                  hintText: 'What will the system be looking at/for?',
                  labelText: 'Subject *',
                ),
                onSaved: (String value) {
                  project.subject = value;
                },
              ),
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.location_searching),
                  hintText: 'Where will the camera be located?',
                  labelText: 'Location *',
                ),
                onSaved: (String value) {
                  project.location = value;
                },
              ),
              new Container(
                padding: const EdgeInsets.all(20.0),
                alignment: const FractionalOffset(0.5, 0.5),
                child: new RaisedButton(
                  child: const Text('SUBMIT'),
                  onPressed: _handleSubmitted,
                ),
              ),
            ],
          )),
    );
  }
}
