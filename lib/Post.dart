
class Post{
  String _id;
  String _nome;
  String _fk_cat_desc;
  String _ingredientes;


  Post(this._id, this._nome, this._fk_cat_desc, this._ingredientes);

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get fk_cat_desc => _fk_cat_desc;

  set fk_cat_desc(String value) {
    _fk_cat_desc = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get ingredientes => _ingredientes;

  set ingredientes(String value) {
    _ingredientes = value;
  }
}