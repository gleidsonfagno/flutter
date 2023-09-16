void main(List<String> argument) {
  pintNme("gleidson");
  pintNme("conceiçao", sobrenome: "fagno");
}

void pintNme(String name, {String? sobrenome}) { //? sefor nullo
  print("my Name is: $name");
  if(sobrenome != null){
  print("My lastname is: $sobrenome");
  }
}
