var Canvas = function(id,data){
	this.canvas = document.getElementById(id);
	this.context = this.canvas.getContext('2d');
	this.data=data;
}

/*Canvas.prototype.draw=function(){
	console.log('draw');
	var context = this.context;
	
}*/
Canvas.prototype.drawPieChart= function () {
    /*if (!me) {
        if (!this.getCanvas()) {
            return;
        }
        me = this.getCanvas();
    }*/
    var data = this.data;
    var canvas = this.canvas; //document.getElementById("piechart");
    var context = this.context; //canvas.getContext("2d");
//    for (var i = 0; i < data.length; i++) {
    var self = this;
    for(var i=0;i<data.length;i++){
    	var item = data[i];
    	var degree = self.valToDegree(item.val);
        var sumToDeg = self.sumTo(data, i);
        self.drawSegment(degree, item.color,item.label, sumToDeg);
    }
    //    this.drawSegment(canvas, context, 110, 'red', 0);
//    this.drawSegment(canvas, context, 250, 'blue',110);
//    }
};	
Canvas.prototype.valToDegree= function (val) {
    if (!val) {
        return 0;
    }
    return (360 / 100) * val;//Precentage to Deggree

};
Canvas.prototype.sumTo= function (a, i) {
    var sum = 0;
    for (var j = 0; j < i; j++) {
        sum += this.valToDegree(a[j].val);
    }
    return sum;
};
Canvas.prototype.degreesToRadians= function (degrees) {
    return (degrees * Math.PI) / 180;
};
Canvas.prototype.drawSegment=function (val, color,label, degree) {
	var canvas = this.canvas;
    var context = this.context;
    context.save();
    var width = canvas.width, height = canvas.height, radius,
            centerX = width / 2, //x for center Point
            centerY = height / 2; //y for center Point
    if (height > width) {
        radius = width / 2 - 5;
    } else {
        radius = height / 2 - 5;
    }
//    var centerX = Math.floor(canvas.width / 2);
//    var centerY = Math.floor(canvas.height / 2);
//    var radius = Math.floor(canvas.width / 2);
    var startingAngle = this.degreesToRadians(degree);
    var arcSize = this.degreesToRadians(val);
    var endingAngle = startingAngle + arcSize;
    context.beginPath();
    context.moveTo(centerX, centerY);
    context.arc(centerX, centerY, radius,
            startingAngle, endingAngle, false);
    context.closePath();
    context.fillStyle = color;
    context.fill();
    context.restore();
//    drawSegmentLabel(canvas, context, label);
};