function(doc){
  if (doc.date && doc.entry && doc.name){
    emit(null, 1);
  }
}
