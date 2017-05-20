class Project {
  final String subject;
  final String location;

  const Project({this.subject, this.location});
}

const kProjects = const <Project>[
  const Project(
      subject: 'Ground-facing Bumper Fasteners',
      location: 'Assembly 2, Trim 3, Station 18'),
  const Project(
      subject: 'Sunroof Drain Hose',
      location: 'Assembly 2, Final 1, Station 24')
];
