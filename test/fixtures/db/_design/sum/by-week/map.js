Date.prototype.getWeek = function() {
  var onejan = new Date(this.getFullYear(), 0, 1);
  return Math.ceil((((this - onejan) / 86400000) + onejan.getDay() + 1) / 7);
};

function(doc) {
  if (doc.date && doc.entry && doc.name){
      date = new Date(doc.date);
      var factor = "1" == doc.entry ? -1 : 1;

      emit([doc.name, date.getFullYear(), date.getWeek()], date.getTime() * factor);
  }
}
