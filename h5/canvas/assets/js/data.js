var rtd = {}   //runtime data
rtd.list = [32, 31, 29, 26, 20, 24, 35, 6, 25, 39, 13,33, 8, 38, 10, 18, 5, 3, 27, 21, 17, 34, 28, 14, 12, 23, 7, 22, 16, 19, 37, 9, 2, 30, 11, 36, 4, 15, 40, 1];
rtd.sortEvent = []

rtd.getList = function() {
    return this.list;
}

rtd.debug = function() {
    console.log(this.list)
}

rtd.max = function () {
    var v = 0;
    for (var i in this.list) {
        if (this.list[i] > v) {
            v = this.list[i]
        }
    }
    return v
}

rtd.swap = function(l,r) {
    var t = this.list[l]
    this.list[l] = this.list[r]
    this.list[r] = t
}

// 快速排序的数据
rtd.qs = {
    left:-1,
    right:-1,
    pivot:-1,
    endIndex: -1, 
    startIndex: -1, 
}
