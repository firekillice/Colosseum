var quickSort = {}
quickSort.step = 0;

quickSort.draw = function(event){
    console.log('drawing once ')
    var base_x = 0;
    var base_y = config.ctx.height();
    painting.startDraw();

    var ectx = event.ectx
    if (ectx.pivot != null ) {
        var value = data.d[ectx.pivot]
        var point_from_x = base_x
        var point_from_y = base_y - value * config.heightBasePiexel()
    
        var point_to_x = config.ctx.width()
        var point_to_y = base_y - value * config.heightBasePiexel()
        this.drawLine(point_from_x, point_from_y, point_to_x, point_to_y) 
    }

    painting.drawList(base_x, base_y, event.d, config);
}

quickSort.onLoad = function() {
    this.draw(
        UIEvent.buildEvent(UIEvent.event_type.Normal, rtd.list, {})
    )
}

quickSort.partition = function(startIndex, endIndex) {
    console.log(startIndex + " " + endIndex );

    var qsc = {}

    items = rtd.getList()
    var pivot = items[startIndex];//取第一个元素为基准值
    qsc.pivot = startIndex;
    qsc.startIndex = startIndex
    qsc.endIndex = endIndex

    var left = startIndex;
    var right = endIndex;
    while (true) {
        //从左往右扫描
        while (items[left] <= pivot) {
            left++;
            if (left == right) {
                break;
            }
        }

        //从右往左扫描
        while (pivot < items[right]) {
            right--;
            if (left == right) {
                break;
            }
        }

        //左右指针相遇
        if (left >= right) {
            break;
        }
        rtd.swap(left, right)

        qsc.left = left
        qsc.right = right
        rtd.sortEvent.push(UIEvent.buildEvent(UIEvent.event_type.Swap, rtd.list, qsc));
    }

    rtd.swap(startIndex, right)

    qsc.left = startIndex
    qsc.right = right
    rtd.sortEvent.push(UIEvent.buildEvent(UIEvent.event_type.Swap, rtd.list, qsc));
    
    return right;
}

quickSort.sort = function(left, right) {
    if ( right <= left) {
        return;
    }

    if (rtd.getList().length > 1) {
        index = this.partition(left, right);
        rtd.sortEvent.push(UIEvent.buildEvent(UIEvent.event_type.PickPivot, rtd.list, {}));

        this.sort(left, index - 1);
        this.sort(index + 1, right);
    }

    rtd.sortEvent.push(UIEvent.buildEvent(UIEvent.event_type.Normal, rtd.list, {}));
}

quickSort.init = function() {
    if (rtd.sortEvent.length == 0) {
        this.sort(0, rtd.getList().length - 1 ); 
    } 
}

quickSort.start = function(){
    this.init();

    setInterval(() => {
        this.ticker = this.next()
    }, 15);           
}

quickSort.next = function(){
    this.init()
    clearInterval(this.ticker);
    if (this.step < rtd.sortEvent.length - 1) {
        this.draw(rtd.sortEvent[++this.step]);
    }
}

quickSort.previous = function() {
    this.init()
    clearInterval(this.ticker);
    if (this.step >= 1) {
        this.draw(rtd.sortEvent[--this.step]);
    }
}