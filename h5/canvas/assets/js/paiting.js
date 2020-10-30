var painting = {}
painting.context = null

painting.setContext = function (ctx) {
    context = ctx
}

painting.drawLine = function (xFrom, yFrom, xTo, yTo) {
    context.beginPath();
    context.moveTo(xFrom, yFrom);
    context.lineTo(xTo, yTo);
    context.strokeStyle = "red";
    context.stroke();
    context.closePath();
}

painting.drawList = function (x, y, list, config) {
    for(var i in list){
        var point_x = x + config.sidePadding() + (config.barWidth() + config.gap()) * i;
        var bar_height = list[i] * config.heightBasePiexel();
        var point_y = y - bar_height;

        ctx.beginPath();
        /*if(i == data.quickSort.getLeft())
            ctx.fillStyle = config.style.color()['search-border'];
        else if(i == data.quickSort.getRight())
            ctx.fillStyle = config.style.color()['search-border'];
        else if(i == data.quickSort.getPivot())
            ctx.fillStyle = config.style.color()['search-pivot'];
        else ctx.fillStyle = config.style.color()['search-default']*/

        ctx.fillStyle = config.style.color()['search-default']
        ctx.fillRect(point_x, point_y, config.barWidth(), bar_height);
        ctx.closePath();
    }
}

painting.startDraw = function() {
    this.clearCanvas();
}

painting.endDraw = function() {
    
}

painting.clearCanvas = function (){
    context.clearRect(0, 0, cvs.width, cvs.height);
}