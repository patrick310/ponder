import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  @override
  State createState() => new InputViewState();
}

class InputViewState extends State<CreateScreen> {
  final TextEditingController _textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Start a Project")),
      body: _buildCreateProjectForm()
      );
  }

  Widget _buildCreateProjectForm() {
    return new ListView(
      children: [
        new Image.asset(
          'images/lake.jpg',
          width: 600.0,
          height: 240.0,
          fit: BoxFit.cover,
        ),
        new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new TextField(
            controller: _textController,
            onSubmitted: _handleSubmitted,
            decoration:
                new InputDecoration.collapsed(hintText: "The first, the only"),
          ),
        ),
      ],
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
  }
}
