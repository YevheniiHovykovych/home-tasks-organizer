/// Учасник домогосподарства.
class Member {
  const Member({required this.name, this.isAdmin = false});

  final String name;
  final bool isAdmin;

  /// Ім'я для списку учасників: «Євгеній (адміністратор)».
  String get displayName => isAdmin ? '$name (адміністратор)' : name;
}