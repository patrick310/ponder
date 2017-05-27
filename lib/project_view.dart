import 'package:flutter/material.dart';
import 'project_data.dart';
import 'project_creation_view.dart';

class _ProjectListItem extends ListTile {
  _ProjectListItem(Project project)
      : super(
            title: new Text(project.subject),
            subtitle: new Text(project.location),
            leading: new CircleAvatar(child: new Text(project.subject[0])));
}

class ProjectList extends StatelessWidget {
  final List<Project> _projects;

  ProjectList(this._projects);

  @override
  Widget build(BuildContext context) {
    return new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: _buildProjectList());
  }

  List<_ProjectListItem> _buildProjectList() {
    return _projects.map((project) => new _ProjectListItem(project)).toList();
  }
}

class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Vision System Projects"),
        ),
        body: new ProjectList(kProjects),
        floatingActionButton: new FloatingActionButton(
            child: new Text("+"),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (_) => new CreateProjectPage(),
                  ));
            },
            tooltip: "Creates a new vision system project"));
  }
}
