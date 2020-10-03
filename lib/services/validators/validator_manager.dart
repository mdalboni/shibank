String validateAll(List validators){
  for (int i=0; i < validators.length; i++){
    final response = validators[i]();
    if (response != null){
      return response;
    }
  }
  return null;
}