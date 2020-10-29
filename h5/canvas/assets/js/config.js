var config = {}

config.ctx = {}
config.ctx.width = function () {
    return 640;
}

config.ctx.height = function () {
    return 480;
}

// 数值的高度像素基础值
config.heightBasePiexel = function() {
    return 10;
}
// 边间隔
config.sidePadding = function() {
    return 10;
}
//barWidth
config.barWidth = function() {
    return 10;
}
//柱间隔
config.gap = function() {
    return 2;
}

config.style = {}
config.style.color = function() {
    return {
        "search-default" : "orange", 
        "search-border": "yellow",
        "search-pivot": "red",
    }
}



