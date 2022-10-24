class Json{

  late final String title;
  late final String icon;
  late final String titleAppBar;
  late final String imagem;
  late final String conceito;

  Json({
    required this.title, required this.icon, required this.titleAppBar, required this.imagem, required this.conceito
  });

  Json.fromJson(Map<String, dynamic> json){
    title = json['title'];
    icon = json['iconName'];
    titleAppBar = json['titleAppBar'];
    imagem = json['imageLink'];
    conceito = json['concept'];

  }


}
