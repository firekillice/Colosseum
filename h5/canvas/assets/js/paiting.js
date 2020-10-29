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

painting.barAnimation = function (left, right) {
    
}

painting.drawRefLine = function(x, y, data, config) {
    var pivot = data.quickSort.getPivot();
    if (pivot == null || pivot == -1) {
        return
    }
    var value = data.getList()[pivot]
    var point_from_x = x
    var point_from_y = y - value * config.heightBasePiexel()

    var point_to_x = config.ctx.width()
    var point_to_y = y - value * config.heightBasePiexel()
    this.drawLine(point_from_x, point_from_y, point_to_x, point_to_y)
}

painting.drawList = function (x, y, data, config) {
    var list = data.getList()

    for(var i in list){
        var point_x = x + config.sidePadding() + (config.barWidth() + config.gap()) * i;
        var bar_height = list[i] * config.heightBasePiexel();
        var point_y = y - bar_height;

        ctx.beginPath();
        if(i == data.quickSort.getLeft())
            ctx.fillStyle = config.style.color()['search-border'];
        else if(i == data.quickSort.getRight())
            ctx.fillStyle = config.style.color()['search-border'];
        else if(i == data.quickSort.getPivot())
            ctx.fillStyle = config.style.color()['search-pivot'];
        else ctx.fillStyle = config.style.color()['search-default']
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