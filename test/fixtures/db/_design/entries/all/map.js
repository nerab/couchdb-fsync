function(doc){
  if (doc.date && doc.entry && doc.name){
    emit(doc._id, doc);
  }
}
