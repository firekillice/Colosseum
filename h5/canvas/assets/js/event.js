var UIEvent = {}

UIEvent.event_type = {
    Add:        1,
    Delete:     2,
    Change:     3,
    Swap:       4,
    Normal:     5,
    PickPivot:  6,
}

UIEvent.buildEvent = function(et, data, context) {
    return {
        d: data,
        type: et,
        ectx: context
    };
}


