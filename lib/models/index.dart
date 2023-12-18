class Endpoint {
  final String name;
  final List<EndpointPath> paths;

  const Endpoint({
    required this.name,
    required this.paths,
  });

  factory Endpoint.fromJson(Map<String, dynamic> json) {
    return Endpoint(
      name: json['name'],
      paths: (json['paths'] as List)
          .map((pathJson) => EndpointPath.fromJson(pathJson))
          .toList(),
    );
  }
}
class EndpointPath {
  final String name;
  final String path;

  const EndpointPath({
    required this.name,
    required this.path,
  });

  factory EndpointPath.fromJson(Map<String, dynamic> json) {
    return EndpointPath(
      name: json['name'],
      path: json['path'],
    );
  }
}
