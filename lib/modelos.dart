

class Usuario {
  String genero;
  String nombreCompleto;
  String correo;
  String urlAvatar;

  Usuario.fromJson(Map<String, dynamic> json) {
    // se toman los valores del json y se inicializan las variables
    genero = json["gender"];
    Map<String, dynamic> jsonNombreUsuario = Map.of(json["name"]);
    nombreCompleto = "${jsonNombreUsuario['title']} ${jsonNombreUsuario['first']} ${jsonNombreUsuario['last']}";
    correo = json["email"];
    Map<String, dynamic> jsonAvatar = Map.of(json["picture"]);
    urlAvatar = jsonAvatar["thumbnail"];
  }

  @override
  String toString() {
    return nombreCompleto;
  }
}